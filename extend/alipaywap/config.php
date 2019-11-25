<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2017032706426690",

		//商户私钥，您的原始格式RSA私钥
		'merchant_private_key' => "MIIEpQIBAAKCAQEAy/Nqj3EnVuEQm6A8wFTEclgXPISwLs1nIGvWMEBKlhFDdUK1f6hOBBnLik4FTY9pgqJhKh6q12GcEZzCyfHPenyST9q78Lb3QhyqouYnXIY8FaWgrv40upsFGqyQWhGjGllejbxHmrmQOSKhONPxBoy+V50q5WkuAbhoE+zVKxpuzNQkVmpHDbtD0VFr6H01hC2rS/bHnfjhZhcE0jxG0faUtIzzuyInDGGkS9lGI+2yG0j0MnV58j6ges85y8ABXJQAD81IOCVbAfYx33t+sAKo7ImAWA+rLhvqgCuXbVfz1DDZO6TsY5NBvDt7cTcSrvgjlJuV/pTqxdNmBWgpkQIDAQABAoIBAQCok6iuq97SZvGtUQMmDmraAIokUaC27ryhBcFi3KFJ7TcPA3a1782cgh3FUbv8Yd/aRJF/mR2pLVstC5/N//t4yOK+8pOJ4hH6KWu5ffdm+OVNFzv7qM64t02+wIgIiq+AJgKLsOaWs27Max1LtZNx0H+8N4KvYQLQFTah0Y5ZMuLL2eWkyhBmhfraxAg7+RY8AUwwoOUOdbABDQ67vtCLA1aoa2b2sOu3BGS4NiR9+XplEi4f0dNRge4YT53oM+x5AGFgh2eEdOdBsCEEV1jnAnfb5x8wfuM0QUPkk18E2amYmRUfu0eD/IFe0rXF80WaI32bpjk9CgZH/6J2lRZJAoGBAPm4J+D7lolqpn1kw/86QrGLZ5Iooa3h1qzp3sGQlkcfk8d0GXHnJYNy/URX/vrGhQpUaQMvyGFKU4+jdP3paHdsPoSn1NUaL9n5Fh39U1Xm3B/Oe/Dx7D0qDn0hDnw0g6O7XEIHnONT2ABehT7R0tmC8d4vqF2Ih2gcqpivZUjbAoGBANEUkzpVqIzamUqOPmABe4rbXyiVHdtPLhfVZEyg9jbZNGoMLtCeAjRG7N5Ru43Wm8JVZ3H4RSGjYowD1WrQFP7Xw80CDuz4Jm1yqXPrka6VK0ROnH5STu2SKCzHeUM4fGGg83OrnNs7xsLZMsKuyvmj56+9YZf3AZN5rJ+Fvp0DAoGBAL/b7Ue+BHqvphrRQITnjjY6lOiGrzGZQga36J1vKQacDD5BxQruPLQxtMS9lvm1bKHzGHuKSrn1ER5ax5gNrGWUlLP2/l58MCeYaJXB/DUTmiwVyMPmG0si9N7OdwKWlk1FtixFDRTbZilidZ0+OHFFWe8LTqAONXqYC7ojh/3hAoGBAJMhvoWzl9wfTPZ5aQ2YnX7W530gipU1gENHaMDAGOP6L/dcwWkPeI+fRbshmzGyT4QPI6/BPazxVD0hyYLUEaJQ5joTc7tw2WH16adoo+lOkdcM1vXSKDbovprceMpEKsttP0UsBEMHKtUdkaoM5UuN+1HhnJcbPKGyYzcTIFNPAoGAdWvjlJDMqHVB9njnu3Br9Ztjn+458oTCjvKXeVg/AWZCIu0Kaxd1OvhzqfMuAMrkXJFeCSg/Y2MZd0iDua2gVlPGwk2mkoyuATo91gK5bHzJrogScZD968C6d2TtRLHvhvCLitlZ+7mKczSLZQ2XP/gmhmuolzzu4k8hbMzTn8k=",
		
		//异步通知地址
		'notify_url' => "http://www.haiji.hk/alipay_wap_notify.php",
		
		//同步跳转
		'return_url' => "http://www.haiji.hk/wap/user/alipay_return",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmA7dSHTWZaZVCCDHB28hPxZcKA148wvTk13LtFIvTnV3H0WNRwqyn3fq759kf3kW/AquPHwjBkEH7vQcD1PMG3ra+gZe9s/PLx5h1NQ2BmzigEcsvCAv4kXjGOOafoJLw++x9Z7AdjD1130kvpJcOtk5wntrdBOBRnOMaX5ia1OKpRLA9/jS8eDN3IrRey9FvqXBV+ZP71+NpY/oZYdpuVejPad4vpshb8eP2AI2Yf8Rv5AAoiwiil8VCXGVPrVBY1CJuAUgq6hOscPnqD2ACvCBCZTsNb607Mda6wue0cTmoOxCw+oTWt/GH9nCzYCIGhyHtf0ogsKvED/P8PEZ4wIDAQAB",
		
	
);