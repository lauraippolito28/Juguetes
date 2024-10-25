// conexion de BD 
const express=require('express');
const mongoose=require('mongoose');

const app=express();
const PORT = 3000; 

// crear el cuerpo de las peticiones
app.use(express.json());

// conexión BD 
mongoose.connect('mongodb://localhost:27017/BDMongo',{
    
})
