def log_in_as(email: email, password: password)
  fill_in("Email", with: email)
  fill_in("Password", with: password)
  click_button("Log in")
end
