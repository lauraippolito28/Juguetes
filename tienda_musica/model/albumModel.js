import { Schema } from "mongoose"

const albumSchema = new Schema({
    nombreAlbum: String,
    artistaAlbum: String, 
    anioAlbum: Number
})

export const albumModel = new mongoose.model('album',albumModel)