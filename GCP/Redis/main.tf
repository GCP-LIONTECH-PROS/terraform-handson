resource "google_redis_instance" "liontechpros-dev" {
  name = "liontechpros-dev"
  memory_size_gb = 1
  tier = "BASIC"

  location_id = "northamerica-northeast2-a"
  authorized_network = "default"

  redis_version = "REDIS_5_0"
  display_name = "Redis Instance from terraform"

}