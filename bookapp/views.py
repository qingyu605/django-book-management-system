from django.shortcuts import render

# Create your views here.
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib import messages
from django.utils.translation import gettext_lazy as _
from django.db.models import Q
from .models import Book, Category
from .forms import BookForm, BookSearchForm
from django.conf import settings
from django.utils.text import slugify



class BookListView(ListView):
    model = Book
    template_name = 'bookapp/book_list.html'
    context_object_name = 'books'
    paginate_by = 3  # 设置每页显示3个图书

    def get_queryset(self):
        queryset = Book.objects.filter(status='published').order_by('-published_date')

        # 处理搜索
        form = BookSearchForm(self.request.GET)
        if form.is_valid():
            q = form.cleaned_data.get('q')
            category = form.cleaned_data.get('category')

            if q:
                queryset = queryset.filter(
                    Q(title__icontains=q) |
                    Q(author__icontains=q) |
                    Q(description__icontains=q)
                )

            if category:
                queryset = queryset.filter(category=category)

        # 确保所有书籍都有有效的slug
        for book in queryset:
            if not book.slug:
                book.slug = slugify(book.title)
                book.save()

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search_form'] = BookSearchForm(self.request.GET)
        context['categories'] = Category.objects.all()
        return context


class BookDetailView(DetailView):
    model = Book
    template_name = 'bookapp/book_detail.html'
    context_object_name = 'book'

    def get_queryset(self):
        return Book.objects.filter(status='published')


class BookCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = Book
    form_class = BookForm
    template_name = 'bookapp/book_form.html'
    success_url = reverse_lazy('bookapp:book_list')

    def test_func(self):
        return self.request.user.is_admin()

    def form_valid(self, form):
        form.instance.created_by = self.request.user
        messages.success(self.request, _('图书添加成功！'))
        return super().form_valid(form)


class BookUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Book
    form_class = BookForm
    template_name = 'bookapp/book_form.html'

    def test_func(self):
        book = self.get_object()
        return self.request.user.is_admin() and book.created_by == self.request.user

    def form_valid(self, form):
        messages.success(self.request, _('图书信息已更新！'))
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('bookapp:book_detail', kwargs={'slug': self.object.slug})


class BookDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Book
    template_name = 'bookapp/book_confirm_delete.html'
    success_url = reverse_lazy('bookapp:book_list')

    def test_func(self):
        book = self.get_object()
        return self.request.user.is_admin() and book.created_by == self.request.user

    def delete(self, request, *args, **kwargs):
        messages.success(request, _('图书已成功删除'))
        return super().delete(request, *args, **kwargs)