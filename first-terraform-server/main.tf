# Provider Block
provider "aws" {
  region = "eu-central-1" # Frankfurt bölgesi (kendine yakın bir bölge seçebilirsin)
}

# Resource Block
resource "aws_instance" "jenkins_sunucum" {
  ami           = "ami-04f76ebf53292ef4d" # Bu Ubuntu 24.04'ün AWS'teki ID'sidir (eu-central-1 için)
  instance_type = "t3.micro"              # AWS Free Tier (Ücretsiz Katman) destekli küçük makine tipi

  tags = {
    Name = "Jenkins-CI-Server"
  }
}
