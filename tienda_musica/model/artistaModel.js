import { Schema } from "mongoose"

const artistaSchema = new Schema({
    nombreArtista: String,
    paisArtista: String 
})

export const artistaModel = new mongoose.model('artista',artistaModel)