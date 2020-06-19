from django.urls import path
from . import views as pages_views

urlpatterns = [
    # Paths de pages
    path('<int:page_id>/<slug:page_slug>/', pages_views.page, name='page')
]