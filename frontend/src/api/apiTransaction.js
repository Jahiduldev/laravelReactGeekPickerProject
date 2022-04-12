import axios from 'axios';
import { API } from '../utils/config';

export const createSendMoney = (token, data) => {

     console.log(data);
    return axios.post(`http://localhost:8000/api/sendToCustomer`, data, {

        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`
        }
    })

    

   
};


