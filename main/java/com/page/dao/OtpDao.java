package com.page.dao;

import java.util.Random;

public class OtpDao {
	int otp;

	public static void main(String[] args) {

		System.out.println("Invoked getFourDigitOTP() ");
		Random random = new Random();
		int otp = random.nextInt(1000000);
		if (otp != 0)

		{
			System.out.println("OTP :" + otp);
		} else {
			System.out.println("OTP is Invalid");
		}

	}

}
