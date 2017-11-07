require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
  cloud_name: ENV["shrine_cloud_name"],
	api_key:    ENV["shrine_api_key,"],
	api_secret: ENV["shrine_api_secret"]
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store")
}
