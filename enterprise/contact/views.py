from django.shortcuts import render, redirect
from django.urls import reverse
from django.core.mail import EmailMessage
from .forms import ContactForm

# Create your views here.
def contact(request):
    c_form = ContactForm()
    if request.method == "POST":
        c_form= ContactForm(data=request.POST)
        if c_form.is_valid:
            name = request.POST.get('name', '')
            email = request.POST.get('email', '')
            content = request.POST.get('content', '')

            # Enviar correo y redireccionar
            email = EmailMessage(
                "Te contacta",
                "De {} <{}> \n\nEscribió:\n\n{}".format(name, email, content),
                "no-contestar@inbox.mailtrap.io",
                ["daniel.restrepo@unillanos.edu.co"],
                reply_to=[email]
            )

            try:
                email.send()
                return redirect(reverse('contact') + "?Ok")
            except:
                return redirect(reverse('contact') + "?Fail")

    return render(request, "contact/contact.html", {'form':c_form})