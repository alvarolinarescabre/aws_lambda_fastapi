data "archive_file" "sources_code" {
  type        = "zip"
  output_path = "${path.root}/zip/${var.create_zip}"
  source_dir  = "../../src/"
}
