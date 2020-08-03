terraform {
  required_version = ">= 0.12, < 0.13"
}

variable "cloud_credential_api_id" {
  type        = string
  description = "The access_id"
  default     = ""
}

variable "cloud_credential_secret" {
  type        = string 
  description = "The credentials"
  default     = ""
}

variable "region" {
  type        = string
  description = "The project region"
  default     = ""
}

variable "project_id" {
  type        = string
  description = "The project id"
  default     = ""
}

variable "instance_name" {
  type        = string
  description = "The instance name"
  default     = ""
}

variable "boot_disk_image" {
  type        = string 
  description = "The boot_disk initialize image"
  default     = "" 
}

variable "machine_type" {
  type        = string
  description = "The machine type"
  default     = ""
}

variable "zone" {
  type        = string
  description = "The availabile zone"
  default     = ""
}

variable "network_interface" {
  type        = string
  description = "The default network interface"
  default     = "default"
}

provider "google" {
  region  = "us-central1"
  project = "pentium-268209"
  credentials = "{\"type\": \"service_account\", \"project_id\": \"pentium-268209\", \"private_key_id\": \"f154312b8bc06019835ca0955fd311eaa6cb96c0\", \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCHq+pt9fixpagX\\nS58wLdI0bXQD2qUFGqGMzReqtk1yQNTeloGlFri0+n7cyUZNUnrIeuC8UkZDz+/Y\\npyTl6/xd+i6tzzqQF28oThJFmJ5JwbLzzHEMh7+unIwwxiNMQAcUgldUw606D3s8\\nd0RHhT//ItlUdEKOEn/FYvzooiPH/28QNgPikURoNxQQB3fZeNyT+Hq4zJ4PZZN0\\nHKZwYsDYgeYQ9oitaxCDgGqw3ob8pBGDZ3EDP2AffLMSNSOiNmpmC4O6PubhySl5\\ntPJ2hSzD65vMW9fpK7A8c5AWRjb3GQuEaYm/hTFUeF7NRsBxJxel3LnVtgjiBrnw\\nXlLHUXPLAgMBAAECggEALUJ9v1cqMuFHlRXmMiVnFZRZ+psrJ+u9bwJQXePZLD9S\\nhDsDXvaYgc97GN6QdGUKjuznIgv0YtTwd38zAPzbwOIgRl12dPFMZM6+q7cBPyu+\\nLjTKldqHaJHS9sZyqhJGCmJ9DcsFc/QMMZy8C3v5YHzYsaLjPRAQzeF664SDmUky\\nAvFCbECcWBL4h4PQDJKImO8W55fd5dmeJa7MLkLsOeSiQh+4MesnmwXfim4jbU3x\\n98US593fdnhYqMcuis1+AgMyRd/3BP9GCSYzqHt7HhHW476vavmeJmK7qJdnlspX\\nm3CnXMoa9WF/8NnBJipI+ezsgVdv86FZaer3Nxi9eQKBgQC8a3ZI897n20KTQZIV\\n3I+/4dbSZiXuyVThTnCus4Pnc0j4ZPWUbSl7wj74yprBHBSrZCXHELfCUiWB7Fs5\\n50Aplqpas+j78G5NIFRANSWTen5Wn3QzQRuqmCq2APowkpqXocEnTJ/jD3UJoPjk\\nNpIdPSROcn+/ClumpWyGO0x4VwKBgQC4VShlKurLFASYqg/kTsZqXqXhbseL/zfR\\nDl71Fz3URNYNsBosEsjyKGKoVRXK0zUMAsRv2Lye1xi+sCzAnoUJ0UApACB9Uinw\\nYPZp1lBYpShojdPaQ/uifM1gg34FgBfx6jgJTQW+T1vQ46PRbw7PwusLnT5yRhhP\\ni6tCwFxHrQKBgFLlMHAeIsZ894hTw9Ksa+3ujRWZ7TxmBVruqLKjtfeBB+yIdmbr\\ns+GH7y6D7JvjH9DbyacP2ti6TVggxW3vKJJjf+VR28Hj4JM8EvUArNx6etTfaD8Y\\nePSP59KVEX2HMk5d0t3YX0uFRGeNE5NL0vLcMHn28+73vqTNiLZxpk4XAoGBALJa\\nWyp/+wwhQ00/hv7dpae4CoJ0AImZmLUjVYeJRF7Fd+Nol/o69skvgD3ljZ9g+nuz\\nlcOujtqVvrCKn9KDzq+wEodZQxZe0ItwFhxTrAwJSW7Yg7o1ex096i3PLLk/tmtw\\nt2Vwa/U2rd0Q1SnIbiliLLBhJdHFtrIIrt14aBFFAoGAIOiB2xvTCGWGMarQ4bmX\\nKQ6Mzj3Ui1R2bf1xqu8N7Rc+NOEMZ83sSgIs0LvfsOARWDAQSTkN74hCClnIlvaF\\na6f/RsUAWU7EkmS/RMWb3HJsOVrHny6iUJ6U83j2skL/F5j/fYCOuE7+HpJMT2VV\\n0NelUv/ELhR6xB6Yee/IRX4=\\n-----END PRIVATE KEY-----\\n\", \"client_email\": \"976132859446-compute@developer.gserviceaccount.com\", \"client_id\": \"105632701453812571883\", \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\", \"token_uri\": \"https://oauth2.googleapis.com/token\", \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\", \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/976132859446-compute%40developer.gserviceaccount.com\"}"
  # Allow any 3.11.X version of GCP provider 
  # version = "~> 3.0"
}

resource "google_compute_instance" "ins" {
  name          = "qa-test-terraform"
  machine_type  = "f1-micro"
  zone          = "us-central1-a"
  network_interface {
    network     = var.network_interface
    access_config {
      // Ephemeral IP
    }
  }
  boot_disk {
    initialize_params {
      image = "centos-8-v20200205"
    } 
  } 
}

output "instance_info" {
  value       = ["${google_compute_instance.ins.*}"]
  description = "The instance info created"
}
