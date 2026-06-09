import 'package:http/http.dart';

// const baseUrl = 'http://192.168.1.8:8000/api/V1';
// const baseUrl = 'http://127.0.0.1:8000/api/V1';

const baseUrl = 'http://10.0.2.2:8000/api/v1';

const loginEndpoint = '$baseUrl/login';
const registerEndPoint = '$baseUrl/register';
const signOutEndpoint = '$baseUrl/logout';
const uploadVideosEndpoint = '$baseUrl/upload-video';
const fetchVideosEndpoint = '$baseUrl/videos';

const listLivesEndpoint = '$baseUrl/lives';
const storeLiveEndpoint = '$baseUrl/lives';
const startLiveEndpoint = '$baseUrl/lives/start';

const ouvriersListEndpoint = '$baseUrl/ouvriers/';
const rechercheOuvriersListEndpoint = '$baseUrl/ouvriers/rechercher';
const selectFilterDomaineEndpoint = '$baseUrl/filtered/metiers';
const selectFilterRegionEndpoint = '$baseUrl/filtered/departements';
