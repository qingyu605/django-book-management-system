from django.urls import path
from . import views

app_name = 'bookapp'

urlpatterns = [
    path('', views.BookListView.as_view(), name='book_list'),
    path('create/', views.BookCreateView.as_view(), name='book_create'),
    path('<slug:slug>/', views.BookDetailView.as_view(), name='book_detail'),
    path('<slug:slug>/update/', views.BookUpdateView.as_view(), name='book_update'),
    path('<slug:slug>/delete/', views.BookDeleteView.as_view(), name='book_delete'),
]