import { config } from "dotenv"
import express, { json } from express

import { connectDatabase } from "./config/database.js"
import routes from "./routes/index.js"

config ()
