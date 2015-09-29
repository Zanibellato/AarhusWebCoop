using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AarhusWebCoop.ViewModels
{
    public class ContactForm
    {
        [Required]
        public String Name { get; set; }

        [Required]
        [EmailAddress(ErrorMessage="This is not a valid email address")]
        public String Email { get; set; }

        [Required]
        public String Subject { get; set; }

        [Required]
        public String Message { get; set; }
    }
}