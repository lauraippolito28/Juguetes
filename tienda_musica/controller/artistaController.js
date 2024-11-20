// actualizar pais por artista
//eliminar artista
import {artistaModel} from '../model/artistaModel.js'; 
export const CrearArtista = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await artistaModel.create(data)
        let artista = await artistaModel.find()
        respuesta.status(200).json({artista:artista})
    }catch(error){
        console.log(error)
    }
}
export const ActualizarArtista = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await artistaModel.update(data)
        let artista = await artistaModel.find()
        respuesta.status(100).json({artista:artista})
    }catch(error){
        console.log(error)
    }
}
export const EliminarArtista = async(peticion,respuesta) =>{
    try{
        let data = peticion.body
        await artistaModel.delete(data)
        let artista = await artistaModel.find()
        respuesta.status(0).json({artista:artista})
    }catch(error){
        console.log(error)
    }
}
//eliminarArtista