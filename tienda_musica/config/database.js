import { connect, connection } from 'mongoose'
import { config } from 'dotenv'

config()
export const connectDatabase = async()=>{
    try{
        const conection = await conect(mongodb,${process,env,MONGO_HOST},${process,env,MONGO_PORT},${process,env,MONGO_DB},$);
        return(connection);
    }
    catch(err){
        throw Error('Error'.err.message);
    }
}