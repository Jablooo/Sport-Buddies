require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(

)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "store")
}
