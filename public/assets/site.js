/* Shared behaviour for kurtjones.co.uk: footer year and the contact form. */

document.querySelectorAll('[data-year]').forEach(function (el) {
  el.textContent = new Date().getFullYear();
});

/* ---------- contact form ------------------------------------------------
   Submissions go to Web3Forms, which relays them to the address below. The
   access key is not a secret: it only permits sending to that one address,
   which is why it can sit in public HTML. The form's data-source attribute
   names the page in the email subject, so approach replies are easy to spot.
   If sending ever fails, the form says so and shows the email address.
   ---------------------------------------------------------------------- */
(function () {
  var ACCESS_KEY = '37763eec-9502-4a15-a266-de8f452ed15e';
  var CONTACT_EMAIL = 'kurt@kurtjones.co.uk';
  var form = document.getElementById('contactForm');
  if (!form) return;
  var status = document.getElementById('formStatus');
  var source = form.getAttribute('data-source') || 'kurtjones.co.uk';
  var mailLink = '<a href="mailto:' + CONTACT_EMAIL + '">' + CONTACT_EMAIL + '</a>';

  form.addEventListener('submit', async function (e) {
    e.preventDefault();

    // Bots fill hidden fields; people do not. Fail silently so they learn nothing.
    if (form.querySelector('[name="botcheck"]').value) return;

    if (!form.checkValidity()) {
      status.textContent = 'Please fill in your name, email and message.';
      form.reportValidity();
      return;
    }

    var btn = form.querySelector('button[type="submit"]');
    btn.disabled = true;
    status.textContent = 'Sending…';

    var payload = {
      access_key: ACCESS_KEY,
      name: form.name.value,
      email: form.email.value,
      subject: form.subject.value || 'Enquiry via ' + source,
      message: form.message.value,
      from_name: source,
      replyto: form.email.value
    };

    try {
      var res = await fetch('https://api.web3forms.com/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
        body: JSON.stringify(payload)
      });
      var out = await res.json().catch(function () { return {}; });
      if (res.ok && out.success) {
        form.reset();
        status.textContent = 'Thank you. Your message has been sent and I will reply by email.';
      } else {
        status.innerHTML = 'Your message could not be sent. Please email ' + mailLink + '.';
      }
    } catch (err) {
      status.innerHTML = 'Your message could not be sent. Please email ' + mailLink + '.';
    } finally {
      btn.disabled = false;
    }
  });
})();
