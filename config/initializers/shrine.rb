require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: "jablooo",
	api_key:    "115662595815844",
	api_secret: "vvKgw0T-wxWYiyKaYZOXYMxtm4E"
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store")
}
