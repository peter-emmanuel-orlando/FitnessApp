import axios from 'axios';
import { environment } from './environment';

export const appClient = axios.create({
    baseURL: environment.appContext,
    withCredentials: true
});