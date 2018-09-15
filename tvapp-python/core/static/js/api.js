/**
 * Module defines two helper objects,
 * api - Communicates with the tmdb
 * formatter - Formats API responses to be more usable and relative urls to absolute
 */


const POPULAR_SHOWS_URL = `https://api.themoviedb.org/3/discover/tv?include_null_first_air_dates=false&page=1&sort_by=popularity.desc&language=en-US&api_key=${API_KEY}`;
const SEARCH_URL = `https://api.themoviedb.org/3/search/tv?api_key=${API_KEY}&language=en-US&page=1&query=`;
const DETAILS_URL_ROOT = 'https://api.themoviedb.org/3/tv/';
const DETAILS_PARAMS = `?language=en-US&api_key=${API_KEY}`;
const CONFIG_URL = `https://api.themoviedb.org/3/configuration?api_key=${API_KEY}`;

const api = (function () {
    return {
        getPopular: async () => {
            const res = await fetch(POPULAR_SHOWS_URL);
            const json = await res.json();
            const results = json['results'];
            return results.map(show => formatter.show(show));
        },

        query: async (term) => {
            const url = SEARCH_URL + term;
            const res = await fetch(url);
            const json = await res.json();
            return json['results'].map(show => formatter.show(show));
        },

        details: async (id) => {
            const url = DETAILS_URL_ROOT + id + DETAILS_PARAMS;
            const res = await fetch(url);
            const json = await res.json();
            return formatter.show(json, 'w300');
        }
    }
})();


const formatter = (() => {
    const _init = async () => {
        const res = await fetch(CONFIG_URL);
        const {images} = await res.json();
        formatter.base_url = images.base_url;
        formatter.poster_sizes = images.poster_sizes;
        formatter.profile_sizes = images.profile_sizes;
        formatter.hasInit = true;
    };

    return {
        init: async () => {
            return formatter.hasInit || await _init();
        },

        show: (show, posterWidth = 'w185') => {
            return {
                ...show,
                poster_path: formatter.imageLocation(show.poster_path, posterWidth)
            };
        },

        createdBy: ({name, profile_path}) => {
            return {
                name,
                profile_path: formatter.imageLocation(profile_path, 'w92')
            }
        },

        seasonsSmall: ({name, poster_path}) => {
            return {
                poster_path: formatter.imageLocation(poster_path, 'w92'),
                name,
            }
        },

        imageLocation: (path, width) => {
            if (!path) {
                return '/static/img/no-photo.png'
            }
            return formatter.base_url + width + path;
        }
    }
})();