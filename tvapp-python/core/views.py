from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.conf import settings


@login_required
def index(request):
    context = {
        'API_KEY': str(settings.TMDB_API_KEY)
    }
    return render(request, 'core/index.html', context)


@login_required
def details(request, id):
    context = {
        'API_KEY': settings.TMDB_API_KEY,
        'show_id': id,
    }
    return render(request, 'core/details.html', context)
