﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="ReportsWebFormsSamples.Header" %>

<div class="ej-sb-header">
    <div class="ej-sb-left-side">
        <div class="ej-sb-hamburger-icon ej-sb-icons" onclick="onHamBurgerClick()"></div>
        <div class="ej-sb-platform-name">Bold Reports for ASP.NET WebForms</div>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                <% 
                    dynamic data = sampledata;
                    { %>
                <a class="dropdown-item active"><%= data.platform %></a>
                <% }
                    foreach (var platform in data.otherPlatforms)
                    { %>
                <a class="dropdown-item" onclick='platformSwitcher("<%= platform.Name%>")'><%= platform.Name %></a>
                <% }
                %>
            </div>
        </div>
    </div>
    <div class="ej-sb-right-side">
        <a href="https://help.boldreports.com" title="Documentation" target="_blank">
            <span class="ej-sb-header-icons sb-icon-documentation"></span>
        </a>
        <a href="https://www.boldreports.com" target="_blank" title="Product Details">
            <span class="ej-sb-header-icons sb-icon-product"></span>
        </a>
        <a href="https://www.boldreports.com/pricing/on-premise/" target="_blank" title="Download Now">
            <span class="ej-sb-header-icons sb-icon-download"></span>
        </a>
        <div class="ej-sb-divider"></div>
        <a class="ej-sb-button" href="https://on-premise-demo.boldreports.com" title="Report Server" target="_blank">Explore Report Server</a>
    </div>
</div>
