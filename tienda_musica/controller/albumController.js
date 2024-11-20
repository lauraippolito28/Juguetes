import {albumModel} from '../model/albumModel.js'; 
export const CrearAlbum = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await albumModel.create(data)
        let album = await albumModel.find()
        respuesta.status(200).json({album:album})
    }catch(error){
        console.log(error)
    }
}
export const EliminarAlbum = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await albumModel.delete(data)
        let album = await albumModel.find()
        respuesta.status(0).json
    }catch(error){
        console.log(error)
    }
}
export const VendidosAlbum = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await albumModel.create(data)
        let album = await albumModel.find()
        respuesta.status(300).json({album:album})

    }catch(error){
        console.log(error)
    }
}
