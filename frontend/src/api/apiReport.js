import axios from 'axios';
import { API } from '../utils/config';

export const transactionReport = () => {
    return axios.get(`http://localhost:8000/api/transactionReport`, {
        headers: {
            'Content-Type': 'application/json'
        }
    })
};
