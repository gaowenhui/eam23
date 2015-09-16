
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

public class SymmetricAlgorithm {
	//¸ßÎÄ»Ô 20150916
	private String strKey = "&^%$*#@~";
	private String info;

	public SymmetricAlgorithm(String info) {
		this.info = info;
	}

	public SymmetricAlgorithm(String info, String strKey) {
		this.info = info;
		this.strKey = strKey;
	}

	private Key getKey() {
		byte[] keyBtye = this.strKey.getBytes();

		byte[] _keyByte = new byte[8];

		for (int i = 0; (i < keyBtye.length) && (i < _keyByte.length); i++) {
			_keyByte[i] = keyBtye[i];
		}

		return new SecretKeySpec(_keyByte, "DES");
	}

	public String desEncrypt() {
		return desEncrypt(this.info, "UTF-8");
	}

	public String desEncrypt(String origin, String encoding) {
		if ((origin == null) || (encoding == null))
			return null;
		try {
			return encrypt(origin.getBytes(encoding), "DES");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String desDecrypt() {
		return desDecrypt(this.info, "UTF-8");
	}

	public String desDecrypt(String ciperData, String encoding) {
		if ((ciperData == null) || (encoding == null)) {
			return null;
		}
		byte[] b = decrypt(EncryptHelper.hex2byte(ciperData), "DES");
		try {
			return new String(b, encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String encrypt(byte[] data, String algorithm) {
		try {
			Key key = getKey();

			Cipher c1 = Cipher.getInstance(algorithm);
			c1.init(1, key);
			byte[] cipherByte = c1.doFinal(data);
			return EncryptHelper.byte2hex(cipherByte);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}

	private byte[] decrypt(byte[] data, String algorithm) {
		try {
			Key key = getKey();
			Cipher c1 = Cipher.getInstance(algorithm);
			c1.init(2, key);
			return c1.doFinal(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		SymmetricAlgorithm s = new SymmetricAlgorithm("gp3adm", "&^%$*#@~");

		System.out.println(s.desEncrypt("gp3adm", "UTF-8"));

	}
}