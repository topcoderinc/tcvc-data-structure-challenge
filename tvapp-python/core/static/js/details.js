/**
 * Script used to render the show details pages
 */

$(document).ready(async () => {

    await formatter.init();
    const show = await api.details(showId);

    $('#title').text(show['name']);
    $('#poster-img').attr('src', show['poster_path']);
    $('#overview').text(show['overview']);

    $('#creators').append(createdBy(show));
    $('#seasons').append(seasons(show));

});

/**
 * Creates the HTML elements for the show's creators
 *
 * @param created_by
 * @returns {string[]}
 */
function createdBy({created_by}) {
    const formatted = created_by.map(formatter.createdBy);
    return formatted.map(({profile_path, name}) => `
        <div class="mx-4">
            <img src=${profile_path}>
            <p class="creator-name">${name}</p>
        </div>
    `
    );
}

/**
 * Creates the HTML elements for the show's seasons
 *
 * @param seasons
 * @returns {string[]}
 */
function seasons({seasons}) {
    const formatted = seasons.map(formatter.seasonsSmall);
    return formatted.map(({poster_path, name}) => `
        <div class="mx-4">
            <img src=${poster_path}>
            <p class="creator-name">${name}</p>
        </div>
    `
    );
}