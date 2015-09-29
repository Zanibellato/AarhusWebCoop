using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;
using AarhusWebCoop.ViewModels;
using System.Net.Mail;
using Umbraco.Core.Models;

namespace AarhusWebCoop.Controllers
{
    public class ContactFormSurfaceController : Umbraco.Web.Mvc.SurfaceController
    {
        //
        // GET: /ContactFormSurface/

        public ActionResult Index()
        {
            return PartialView("ContactForm", new ContactForm());
        }

        [HttpPost]
        public ActionResult HandleFormSubmit(ContactForm model)
        {
            if (!ModelState.IsValid)
            {
                return CurrentUmbracoPage();
            }

            //Creating new content for the CMS

            IContent comment = Services.ContentService.CreateContent(model.Subject, CurrentPage.Id, "Comment");

            comment.SetValue("name", model.Name);
            comment.SetValue("email", model.Email);
            comment.SetValue("subject", model.Subject);
            comment.SetValue("message", model.Message);

            //Saving
            Services.ContentService.Save(comment);

            //Sending the message
            MailMessage message = new MailMessage();
            message.To.Add("v.zanibellato@outlook.com");
            message.Subject = model.Subject;
            message.From = new MailAddress(model.Email, model.Name);
            message.Body = model.Message + "\n my email is:" + model.Email;

            using (SmtpClient smtp = new SmtpClient())
            {
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network; 
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = true;
                smtp.Host = "smtp.gmail.com"; 
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("slsl54511@gmail.com", "password");
                smtp.EnableSsl = true;
                try
                {
                    smtp.Send(message);
                    TempData["success"] = true;
                }
                catch (Exception ex)
                {
                    //Error, could not send the message
                    Response.Write(ex.Message);
                }
            }
            return RedirectToCurrentUmbracoPage();
        }

    }
}
