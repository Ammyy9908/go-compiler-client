import axios from "axios"


async function executeCode(data) {
    const response = await axios.post("http://localhost:8080/api/v1/submission", data, {
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
      });
    return response.data      
}

export { executeCode }