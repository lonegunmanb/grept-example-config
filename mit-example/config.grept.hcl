data http mit_license {
  url = "https://raw.githubusercontent.com/Azure/terraform-verified-module/main/LICENSE"
}

rule file_hash license {
  glob = "LICENSE"
  hash = sha1(data.http.mit_license.response_body)
}

fix local_file license {
  rule_ids = [rule.file_hash.license.id]
  paths    = [rule.file_hash.license.glob]
  content  = data.http.mit_license.response_body
}
