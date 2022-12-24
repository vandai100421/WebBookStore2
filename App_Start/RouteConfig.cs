﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebBookStore
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{*botdetect}",
     new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });
            routes.MapRoute(
           name: "Cart",
           url: "gio-hang",
           defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
           namespaces: new[] { "OnlineShop.Controllers" }
       );
            routes.MapRoute(
        name: "Payment",
        url: "thanh-toan",
        defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
        namespaces: new[] { "OnlineShop.Controllers" }
    );
            routes.MapRoute(
                name: "Add Cart",
                url: "them-gio-hang",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
                namespaces: new[] { "WebBookStore.Controllers" }
            );

            routes.MapRoute(
        name: "Payment Success",
        url: "hoan-thanh",
        defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
        namespaces: new[] { "OnlineShop.Controllers" }
            );



            routes.MapRoute(
                  name: "Default",
                  url: "{controller}/{action}/{id}",
                  new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                  new[] { "WebBookStore.Controllers" }
              );
        }
    }
}