import { ICredentials } from "../redux/interfaces";
import { create } from "domain";

//from https://www.quirksmode.org/js/cookies.html

const credentialsCookieName = 'signInCredentials';

export function setCredentialsCookie(credentials: ICredentials) {
	console.trace();
	console.log('tried to set credentials')
	console.log(credentials)
	if(credentials && credentials.username && credentials.password){
		const expires = "";
		const value = JSON.stringify(credentials);
		createCookie(credentialsCookieName, value, expires);
	}
}

export function getCredentialsCookie(): ICredentials | undefined{
	console.trace();
	console.log('tried to get credentials')
	try{
		const credentials = readCookie(credentialsCookieName) || '';
		console.log(credentials)
		return JSON.parse(credentials) as ICredentials;
	}
	catch (e){
		console.log(undefined)
		return undefined;
	}
}

export function clearCredentialsCookie(){
	console.trace();
	console.log('tried to clear credentials')
    eraseCookie(credentialsCookieName);
}

export function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toUTCString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

export function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

export function eraseCookie(name) {
	createCookie(name,"",-1);
}