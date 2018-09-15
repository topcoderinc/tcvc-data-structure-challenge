/**
 * Script used to render the initial index/search page.
 */

$(document).ready(async () => {

    await formatter.init();

    $('.search').on('keyup', getSearchResults);

    const popularShows = await api.getPopular();
    const showCards = popularShows.map(makeShowCard);

    const $showList = $('#popular-shows');
    $showList.append(showCards);


    async function getSearchResults(e) {
        const term = $(e.currentTarget).val();
        if (!term.length) {
            const showCards = popularShows.map(makeShowCard);
            $showList.empty();
            $showList.append(showCards);
        }

        if (term.length > 2) {
            const searchedShows = await api.query(term);

            const showCards = searchedShows.map(makeShowCard);
            $showList.empty();
            $showList.append(showCards);
        }
    }
});


function makeShowCard({name, overview, poster_path, id}) {
    return `
    <li>
        <a class="poster-img" href="/details/${id}">
            <img src="${poster_path}">
        </a>
        <div class="show-body">
            <h1>${name}</h1>
            <p>${overview}</p>
        </div>
    </li>
    `;

}