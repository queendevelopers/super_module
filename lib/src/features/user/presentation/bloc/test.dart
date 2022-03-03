// @dart=2.9

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';

class RSAUtils {
  static RSAPublicKey publicKey;

  static RSAPrivateKey privateKey;

  static RSAUtils instance;

  //Singleton mode
  static RSAUtils getInstance(String publicKeyFile, String privateKeyFile) {
    if (instance == null) {
      instance = RSAUtils(publicKeyFile, privateKeyFile);
    }
    return instance;
  }

  //Ensure that the PEM certificate is only parsed once
  RSAUtils(String publicKeyFile, String privateKeyFile) {
    if (publicKeyFile != null) {
      publicKey = parse(publicKeyFile);
    }
    if (privateKeyFile != null) {
      privateKey = parse(privateKeyFile);
    }
  }

  //Generate public key and private key, default 1024.
  static List<String> generateKeys([int bits = 1024]) {
    var rnd = getSecureRandom();
    var rsapars = RSAKeyGeneratorParameters(BigInt.parse("65537"), bits, 64);
    var params = ParametersWithRandom(rsapars, rnd);

    var keyGenerator = KeyGenerator("RSA");
    keyGenerator.init(params);

    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair =
        keyGenerator.generateKeyPair();
    RSAPrivateKey privateKey = keyPair.privateKey;
    RSAPublicKey publicKey = keyPair.publicKey;

    var pubKey = encodePublicKeyToPemPKCS1(publicKey);

    var priKey = encodePrivateKeyToPemPKCS1(privateKey);

    return [pubKey, priKey];
  }

  ///RSA public key encryption
  Uint8List encryptByPublicKey(Uint8List data) {
    try {
      var keyParameter = () => PublicKeyParameter<RSAPublicKey>(publicKey);
      AsymmetricBlockCipher cipher = AsymmetricBlockCipher("RSA/PKCS1");
      cipher.reset();
      cipher.init(true, keyParameter());
      int index = 0;
      int strlength = data.length;
      final keysize = publicKey.modulus.bitLength ~/ 8 - 11;
      final blocksize = publicKey.modulus.bitLength ~/ 8;
      final numBlocks =
          (strlength ~/ keysize) + ((strlength % keysize != 0) ? 1 : 0);
      Uint8List list = Uint8List(blocksize * numBlocks);
      int count = 0;
      while (index < strlength) {
        Uint8List listtmp;
        if (index + keysize > strlength) {
          listtmp = data.sublist(index, strlength);
          index = strlength;
        } else {
          listtmp = data.sublist(index, index + keysize);
          index += keysize;
        }
        Uint8List encryptResult = cipher.process(listtmp);
        for (int v_i = 0; v_i < blocksize; v_i++) {
          list[count * blocksize + v_i] = encryptResult[v_i];
        }
        count += 1;
      }
      return list;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  ///RSA private key encryption
  Uint8List encryptByPrivateKey(Uint8List data) {
    try {
      var keyParameter = () => PrivateKeyParameter<RSAPrivateKey>(privateKey);
      AsymmetricBlockCipher cipher = AsymmetricBlockCipher("RSA/PKCS1");
      cipher.reset();
      cipher.init(true, keyParameter());
      int index = 0;
      int strlength = data.length;
      final keysize = publicKey.modulus.bitLength ~/ 8 - 11;
      final blocksize = publicKey.modulus.bitLength ~/ 8;
      final numBlocks =
          (strlength ~/ keysize) + ((strlength % keysize != 0) ? 1 : 0);
      Uint8List list = Uint8List(blocksize * numBlocks);
      int count = 0;
      while (index < strlength) {
        Uint8List listtmp;
        if (index + keysize > strlength) {
          listtmp = data.sublist(index, strlength);
          index = strlength;
        } else {
          listtmp = data.sublist(index, index + keysize);
          index += keysize;
        }
        Uint8List encryptResult = cipher.process(listtmp);
        for (int v_i = 0; v_i < blocksize; v_i++) {
          list[count * blocksize + v_i] = encryptResult[v_i];
        }
        count += 1;
      }
      return list;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  ///RSA public key decryption
  Uint8List decryptByPublicKey(Uint8List data) {
    try {
      var keyParameter = () => PublicKeyParameter<RSAPublicKey>(publicKey);
      AsymmetricBlockCipher cipher = AsymmetricBlockCipher("RSA/PKCS1");

      cipher.reset();
      cipher.init(false, keyParameter());
      int index = 0;
      int strlength = data.length;
      final keysize = publicKey.modulus.bitLength ~/ 8 - 11;
      final blocksize = publicKey.modulus.bitLength ~/ 8;
      final numBlocks = strlength ~/ blocksize;
      Uint8List list = Uint8List(keysize * numBlocks);
      int count = 0;
      int strindex = 0;
      while (index < strlength) {
        Uint8List listtmp =
            data.sublist(count * blocksize, (count + 1) * blocksize);
        Uint8List encryptResult = cipher.process(listtmp);
        for (int v_i = 0; v_i < encryptResult.length; v_i++) {
          list[count * keysize + v_i] = encryptResult[v_i];
        }
        count += 1;
        strindex += encryptResult.length;
        index += blocksize;
      }
      return list.sublist(0, strindex);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  ///RSA private key decryption
  Uint8List decryptByPrivateKey(Uint8List data) {
    try {
      var keyParameter = () => PrivateKeyParameter<RSAPrivateKey>(privateKey);
      AsymmetricBlockCipher cipher = AsymmetricBlockCipher("RSA/PKCS1");
      cipher.reset();
      cipher.init(false, keyParameter());
      int index = 0;
      int strlength = data.length;
      final keysize = publicKey.modulus.bitLength ~/ 8 - 11;
      final blocksize = publicKey.modulus.bitLength ~/ 8;
      final numBlocks = strlength ~/ blocksize;
      Uint8List list = Uint8List(keysize * numBlocks);
      int count = 0;
      int strindex = 0;
      while (index < strlength) {
        Uint8List listtmp =
            data.sublist(count * blocksize, (count + 1) * blocksize);
        Uint8List encryptResult = cipher.process(listtmp);
        for (int v_i = 0; v_i < encryptResult.length; v_i++) {
          list[count * keysize + v_i] = encryptResult[v_i];
        }
        count += 1;
        strindex += encryptResult.length;
        index += blocksize;
      }
      return list.sublist(0, strindex);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  static SecureRandom getSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(new KeyParameter(new Uint8List.fromList(seeds)));
    return secureRandom;
  }

  static String encodePublicKeyToPemPKCS1(RSAPublicKey publicKey) {
    var topLevel = ASN1Sequence();

    topLevel.add(ASN1Integer(publicKey.modulus));
    topLevel.add(ASN1Integer(publicKey.exponent));

    // var dataBase64 = base64.encode(topLevel.encodedBytes);
    var dataBase64 =
        _castToPrintableEncodingPem(base64.encode(topLevel.encodedBytes));
    return """-----BEGIN RSA PUBLIC KEY-----\n$dataBase64\n-----END RSA PUBLIC KEY-----""";
  }

  static String encodePrivateKeyToPemPKCS1(RSAPrivateKey privateKey) {
    var topLevel = ASN1Sequence();

    var version = ASN1Integer(BigInt.from(0));
    var modulus = ASN1Integer(privateKey.n);
    var publicExponent = ASN1Integer(privateKey.exponent);
    var privateExponent = ASN1Integer(privateKey.d);
    var p = ASN1Integer(privateKey.p);
    var q = ASN1Integer(privateKey.q);
    var dP = privateKey.d % (privateKey.p - BigInt.from(1));
    var exp1 = ASN1Integer(dP);
    var dQ = privateKey.d % (privateKey.q - BigInt.from(1));
    var exp2 = ASN1Integer(dQ);
    var iQ = privateKey.q.modInverse(privateKey.p);
    var co = ASN1Integer(iQ);

    topLevel.add(version);
    topLevel.add(modulus);
    topLevel.add(publicExponent);
    topLevel.add(privateExponent);
    topLevel.add(p);
    topLevel.add(q);
    topLevel.add(exp1);
    topLevel.add(exp2);
    topLevel.add(co);

    // var dataBase64 = base64.encode(topLevel.encodedBytes);
    var dataBase64 =
        _castToPrintableEncodingPem(base64.encode(topLevel.encodedBytes));

    return """-----BEGIN RSA PRIVATE KEY-----\n$dataBase64\n-----END RSA PRIVATE KEY-----""";
  }

  ///Analyze PEM certificate to generate RSA key
  RSAAsymmetricKey parse(String key) {
    final rows = key.split('\n'); // LF-only, this could be a problem
    final header = rows.first;
    if (header == '-----BEGIN RSA PUBLIC KEY-----') {
      return _parsePublic(_parseSequence(rows));
    }

    if (header == '-----BEGIN PUBLIC KEY-----') {
      return _parsePublic(_pkcs8PublicSequence(_parseSequence(rows)));
    }

    if (header == '-----BEGIN RSA PRIVATE KEY-----') {
      return _parsePrivate(_parseSequence(rows));
    }

    if (header == '-----BEGIN PRIVATE KEY-----') {
      return _parsePrivate(_pkcs8PrivateSequence(_parseSequence(rows)));
    }
    // NOTE: Should we throw an exception?
    return null;
  }

  RSAAsymmetricKey _parsePublic(ASN1Sequence sequence) {
    final modulus = (sequence.elements[0] as ASN1Integer).valueAsBigInteger;
    final exponent = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;

    return RSAPublicKey(modulus, exponent);
  }

  RSAAsymmetricKey _parsePrivate(ASN1Sequence sequence) {
    final modulus = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;
    final exponent = (sequence.elements[3] as ASN1Integer).valueAsBigInteger;
    final p = (sequence.elements[4] as ASN1Integer).valueAsBigInteger;
    final q = (sequence.elements[5] as ASN1Integer).valueAsBigInteger;

    return RSAPrivateKey(modulus, exponent, p, q);
  }

  ASN1Sequence _parseSequence(List<String> rows) {
    final keyText = rows
        .skipWhile((row) => row.startsWith('-----BEGIN'))
        .takeWhile((row) => !row.startsWith('-----END'))
        .map((row) => row.trim())
        .join('');

    final keyBytes = Uint8List.fromList(base64.decode(keyText));
    final asn1Parser = ASN1Parser(keyBytes);

    return asn1Parser.nextObject() as ASN1Sequence;
  }

  ASN1Sequence _pkcs8PublicSequence(ASN1Sequence sequence) {
    final ASN1BitString bitString = sequence.elements[1];
    final bytes = bitString.valueBytes().sublist(1);
    final parser = ASN1Parser(Uint8List.fromList(bytes));

    return parser.nextObject() as ASN1Sequence;
  }

  ASN1Sequence _pkcs8PrivateSequence(ASN1Sequence sequence) {
    final ASN1BitString bitString = sequence.elements[2];
    final bytes = bitString.valueBytes();
    final parser = ASN1Parser(bytes);

    return parser.nextObject() as ASN1Sequence;
  }

  static String _castToPrintableEncodingPem(String key) {
    var temp = '';
    for (int i = 0; i < key.length; i++) {
      if (i != 0 && i % 64 == 0) temp += '\n';
      temp += key[i];
    }
    return temp;
  }
}
