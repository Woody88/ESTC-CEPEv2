def gen_token
	SecureRandom.urlsafe_base64(6)
end