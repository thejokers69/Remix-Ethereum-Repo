import axios from "axios";
const client = axios.create({ baseURL: "http://localhost:10001/" });
const response = await client.get("http://localhost:10002/");
console.log(response.data);
