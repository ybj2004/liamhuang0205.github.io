﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Default1" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-mobile-web-app-title" content="数学MT">
    <link rel="apple-touch-icon-precomposed"
        href="0.png" />
    <link rel="apple-touch-startup-image"
        href="0.png" />
    <title>数学MT</title>
    <link rel="stylesheet" href="CSS/style.css" type="text/css" />
</head>

<body>

    <div>
                        <a href="Index.aspx">
        <img src="page2/page-2_01.jpg" alt="">
                        </a>
    </div>



    <div class="shop-schedule">
        <div class="schedule">
            <div class="wrapper J_movie_wrap">
                <div class="scroller">
                        <a class="item on slide" href="javascript:void(0);">
                            <img src="page2/奥数1.png" alt="" />
                        </a>
                        <a class="item slide" href="Default2.aspx">
                            <img src="page2/奥数2.png" alt="" />
                        </a>
                        <a class="item  slide" href="Default3.aspx">
                            <img src="page2/奥数3.png" alt="" />
                        </a>
                    </div>
                </div>

                <div class="J_movie_trigger "></div>
                
                <div><img src="page2/奥数1主图.png" alt="" /></div><br />

                <div><img class="jieshao" src="page2/奥数1详情.png" alt="" /></div>

            </div>
        </div>

        </div>


        <div class="CallMT">
            <a href="tel:15395992053">联系老师</a>
        </div>

    <script>!function (n) { "use strict"; function t(n, t) { for (var r in t) n[r] || (n[r] = t[r]) } function r(n, r) { t(n.prototype, r) } function i(n) { var t = n.match(V), r = t[1], i = t[2] || "*", o = t[3] || ""; return e({ n: r, v: i, p: o }) } function e(n) { var t = n.n + "@" + n.v; return n.id = t + n.p, n.k = t, n } function o(n, t) { return t.map ? n : n + ".js" } function a(n, t) { for (var r in t) n[r] = t[r] } function f(n) { var t = n.match(W); return t ? t[0] : n } function u(n, t) { return h(f(t.p).slice(1), n) } function c(n, t) { return n = u(n, t), n ? t.k + "/" + n : t.k } function h(n, t) { var r = (n + "/" + t).split("/").filter(Boolean); return s(r).join("/") } function s(n) { for (var t = 0, r = n.length - 1; r >= 0; r--) { var i = n[r]; "." === i ? n.splice(r, 1) : ".." === i ? (n.splice(r, 1), t++) : t && (n.splice(r, 1), t--) } for (; t--;) n.unshift(".."); return n } function l(n) { return 0 === n.indexOf("./") || 0 === n.indexOf("../") } function p(n) { throw new Error("neuron: " + n) } function v(n) { p("Cannot find module '" + n + "'") } function d(n) { return X[n] || (X[n] = []) } function g(n, t) { d(n).push(t) } function m(n, t) { var r = d(n); r.forEach(function (n) { n(t) }) } function y(n, t) { n || p("null id"), t || (t = {}); var r = t.map || {}; n = r[n] || n; var a, f = l(n); if (f ? (t.id || v(n), n = c(n, t), n = o(n, t), a = i(n)) : (n = t.m && t.m[n] || n, a = i(n)), a.k === t.k) a.graph = t.graph; else { var u = k(a.k, t.graph) || []; a.graph = u, a.v = u[0] || a.v, e(a) } return a } function k(n, t) { var r = it.graph._, i = t ? t[1] : r; return i && n in i ? it.graph[i[n]] : r } function w(n) { return n.loaded ? n.exports : O(n) } function O(n) { n.loaded = !0; var t = n.exports = {}, r = A(n.id), i = f(r), e = n.factory; return e(R(n), t, n, r, i), n.exports } function b(n, t, r) { var i = y(n, t), e = i.graph, o = E(i), a = o.main ? i.k : i.id, f = e[a]; return f || (!r || v(n), f = e[a] = j(o), f.graph = e, f.g || (f.g = Y++)), f } function x(n, t) { J.ready(n, function () { t(w(n)) }) } function E(n) { var t = n.id; return ot[t] || (ot[t] = { n: n.n, v: n.v, p: n.p, id: t, k: n.k, m: {}, l: [], main: !n.p }) } function j(n) { function t() { this.r = [] } return t.prototype = n, new t } function S(n) { !~n.indexOf("@") || p("id with '@' is prohibited") } function R(n) { var t = function (t) { S(t); var r = b(t, n, !0); return w(r) }; return t.async = function (t, r) { var i = t; if (r) { S(t); var e = l(t); if (e) { t = c(t, n); var a = n.entries; t = a ? $(t, a) || $(t + ".js", a) || $(t + ".json", a) || v(i) : o(t, n) } var f = b(t, n); if (!f.main) { if (!e) return; f.a = !0 } x(f, r) } }, t.resolve = function (t) { if (l(t) && (t = u(t, n), !~t.indexOf("../"))) { var r = T(n.k, t); return t = N(t, r), A(n.k + "/" + t) } }, t } function $(n, t) { return ~t.indexOf(n) ? n : Q } function _(n) { var t = Z.createElement("script"); t.src = n, t.async = !0, tt(t, function () { nt.removeChild(t) }), setTimeout(function () { nt.insertBefore(t, nt.firstChild) }, 0) } function L(n, t, r, i) { i || (i = {}); var f = y(n); f.p && (f.p = o(f.p, i), e(f)); var u, c = f.k; i.main && (u = ot[c]); var h = ot[f.id] = u || ot[f.id] || E(f); if (i.main && (ot[c] = h, a(h, f)), a(h, i), !h.factory) { h.factory = r, h.deps = t, M(t, h.m); var s = i.asyncDeps; s && M(s, h.m), B(h, "l") } } function M(n, t) { n.forEach(function (n) { var r = n.split("@")[0]; t[r] = n }) } function B(n, t) { var r, i = n[t]; for (n[t] = Q; r = i.pop() ;) r() } function C(n, t) { var r = ot[n.id]; r.f = n.f, r.a = n.a; var i = r.l; i && (i.push(t), i.length < 2 && I(r)) } function I(n) { if (!n.d) { n.d = !0; var t = n.f, r = n.a, i = n.k; if (~rt.indexOf(i)) { if (!t && !r) return } else rt.push(i); var e = it.loaded, o = t ? n.id : i; if (~e.indexOf(o)) { if (!r) return } else e.push(o); _(P(n)) } } function N(n, t) { var r = n.match(/\.[\w\d]+$/)[0]; return t ? n.replace(new RegExp(r + "$"), "_" + t + r) : n } function P(n) { var t = T(n.k, n.main ? n.n + ".js" : n.p.slice(1)), r = n.main ? n.k + "/" + n.n + ".js" : n.id, i = A(r); return N(i, t) } function T(n, t) { return it.hash && it.hash[n] && it.hash[n][t] } function A(n) { var t = n.replace("@", "/"), r = it.path; return r || p("config.path must be specified"), r = r.replace("{n}", t.length % 3 + 1), r + t } function D(n, t, r) { if (m("beforeready", z(n) + ":" + n.g), !n.factory) return m("beforeload", n.id), C(n, function () { m("load", z(n)), D(n, t, r) }); var i = n.deps, e = i.length, o = n.r; if (!e || !o) return n.r = Q, q(n), t(); if (o.push(t), !(o.length > 1)) { var a = function () { --e || (r.length = 0, r = K, q(n), B(n, "r")) }; r = r ? [n].concat(r) : [n], i.forEach(function (t) { var i = b(t, n); return ~r.indexOf(i) ? a() : void D(i, a, r) }) } } function q(n) { m("ready", z(n) + ":" + n.g) } function z(n) { return n.main ? n.k : n.id } function F(n) { return n } function G(n) { var t, r; for (t in n) r = et[t], r && (it[t] = r(n[t])) } function H(n, t) { var r = b(n); r.f = !0, x(r, t) } var J = { version: "7.2.0" }, K = null, Q = !1; J.ready = function (n, t) { t() }; var U = TypeError; r(Array, { indexOf: function (n, t) { var r = this.length >>> 0; for (t = Number(t) || 0, t = Math[0 > t ? "ceil" : "floor"](t), 0 > t && (t = Math.max(t + r, 0)) ; r > t; t++) if (t in this && this[t] === n) return t; return -1 }, lastIndexOf: function (n, t) { var r = this.length >>> 0; for (t = Number(t) || r - 1, t = Math[0 > t ? "ceil" : "floor"](t), 0 > t && (t += r), t = Math.min(t, r - 1) ; t >= 0; t--) if (t in this && this[t] === n) return t; return -1 }, filter: function (n, t) { for (var r = [], i = 0, e = this.length; e > i; i++) i in this && n.call(t, this[i], i, this) && r.push(this[i]); return r }, forEach: function (n, t) { for (var r = 0, i = this.length; i > r; r++) r in this && n.call(t, this[r], r, this) }, every: function (n, t) { for (var r = 0, i = this.length; i > r; r++) if (r in this && !n.call(t, this[r], r, this)) return !1; return !0 }, map: function (n, t) { for (var r = [], i = 0, e = this.length; e > i; i++) i in this && (r[i] = n.call(t, this[i], i, this)); return r }, some: function (n, t) { for (var r = 0, i = this.length; i > r; r++) if (r in this && n.call(t, this[r], r, this)) return !0; return !1 }, reduce: function (n) { if ("function" != typeof n) throw new U(n + " is not an function"); var t, r = this, i = r.length >>> 0, e = 0; if (arguments.length > 1) t = arguments[1]; else for (; ;) { if (e in r) { t = r[e++]; break } if (++e >= i) throw new U("Reduce of empty array with on initial value") } for (; i > e; e++) e in r && (t = n.call(K, t, r[e], e, r)); return t }, reduceRight: function (n) { if ("function" != typeof n) throw new U(n + " is not an function"); var t, r = this, i = r.length >>> 0, e = i - 1; if (arguments.length > 1) t = arguments[1]; else for (; ;) { if (e in r) { t = r[e--]; break } if (--e < 0) throw new U("Reduce of empty array with on initial value") } for (; e >= 0; e--) e in r && (t = n.call(K, t, r[e], e, r)); return t } }), t(Object, { keys: function () { var n = Object.prototype.hasOwnProperty, t = !{ toString: "" }.propertyIsEnumerable("toString"), r = ["toString", "toLocaleString", "valueOf", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "constructor"], i = r.length; return function (e) { if (e !== Object(e)) throw new U("Object.keys called on non-object"); var o, a = []; for (o in e) n.call(e, o) && a.push(o); if (t) for (var f = 0; i > f; f++) n.call(e, r[f]) && a.push(r[f]); return a } }() }), r(String, { trimLeft: function () { return this.replace(/^\s+/, "") }, trimRight: function () { return this.replace(/\s+$/, "") }, trim: function () { return this.trimLeft().trimRight() } }); var V = /^((?:[^\/])+?)(?:@([^\/]+))?(\/.*)?$/, W = /.*(?=\/.*$)/, X = {}; J.on = g; var Y = 1, Z = document, nt = Z.getElementsByTagName("head")[0], tt = Z.createElement("script").readyState ? function (n, t) { n.onreadystatechange = function () { var r = n.readyState; ("loaded" === r || "complete" === r) && (n.onreadystatechange = K, t.call(this)) } } : function (n, t) { n.addEventListener("load", t, !1) }, rt = []; J.ready = D; var it = J.conf = { loaded: [], graph: { _: {} } }, et = { path: function (n) { return n.replace(/\/*$/, "/") }, hash: F, loaded: F, graph: F }; J.config = G, n.neuron = J, n.define = L, n.facade = function (n) { H(n.entry, function (t) { t.init && t.init(n.data) }) }, n._use = function (n, t) { H(n, t) }, n._load = _; var ot = J.mods = {} }(this);</script>
    <script>    neuron.config({ path: "http://m1.s1.dpfile.com/mod", loaded: ["app-m-movie@0.2.4/js/pages/shop.js", "app-m-movie@0.2.4", "hippo@1.2.7", "nugget-mobile@0.1.3", "json@1.0.1", "util@1.0.5", "events@1.0.5", "clone@0.1.13", "underscore@1.5.3", "wepp-module-event@0.2.1", "class@2.0.5", "iscroll@5.0.11", "util-m-floatbar@1.0.5", "swipe@2.0.0", "wepp-module-toast@0.1.5", "mobile-common-nav@1.2.1"], graph: { "0": ["0.2.4", { "util-m-floatbar@~1.0.5": 1, "mobile-common-nav@~1.2.0": 9, "wepp-module-event@~0.2.0": 11, "iscroll@~5.0.0": 12, "wepp-module-toast@~0.1.0": 13, "swipe@^2.0.0": 14, "zepto-wepp@~1.1.0": 8 }], "1": ["1.0.5", { "class@~2.0.5": 2, "zepto-wepp@~1.1.1": 8 }], "2": ["2.0.5", { "util@~1.0.0": 3, "clone@~0.1.11": 5, "events@~1.0.0": 6, "underscore@~1.5.2": 7 }], "3": ["1.0.5", { "json@~1.0.0": 4 }], "4": ["1.0.1"], "5": ["0.1.13", { "util@~1.0.2": 3 }], "6": ["1.0.5", { "util@~1.0.0": 3 }], "7": ["1.5.3"], "8": ["1.1.6"], "9": ["1.2.1", { "wepp-module-overlay@~0.2.0": 10, "zepto-wepp@~1.1.4": 8, "iscroll@~5.0.10": 12 }], "10": ["0.2.2", { "wepp-module-event@~0.2.0": 11, "zepto-wepp@~1.1.0": 8 }], "11": ["0.2.1"], "12": ["5.0.11"], "13": ["0.1.5", { "wepp-module-overlay@~0.2.0": 10, "zepto-wepp@~1.1.0": 8 }], "14": ["2.0.0"], "15": ["0.1.3", { "hippo@~1.2.2": 16 }], "16": ["1.2.7"], "_": { "app-m-movie@*": 0, "nugget-mobile@*": 15, "hippo@*": 16 } } })</script>
    <script async src="http://m1.s1.dpfile.com/concat/~mod~util~1.0.5~util.js,~mod~clone~0.1.13~clone.js"></script>
    <script async src="http://m1.s1.dpfile.com/concat/~mod~wepp-module-event~0.2.1~wepp-module-event.js,~mod~wepp-module-toast~0.1.5~wepp-module-toast.js"></script>
    <script async src="http://m1.s1.dpfile.com/concat/~mod~hippo~1.2.7~hippo.js,~mod~underscore~1.5.3~underscore.js,~mod~iscroll~5.0.11~iscroll.js"></script>
    <script async src="JS/events.js"></script>
    <script async src="http://m1.s1.dpfile.com/concat/~mod~app-m-movie~0.2.4~js~pages~shop.js,~mod~app-m-movie~0.2.4~app-m-movie.js"></script>
    <script async src="http://m1.s1.dpfile.com/concat/~mod~nugget-mobile~0.1.3~nugget-mobile.js,~mod~class~2.0.5~class.js"></script>
    <script async src="JS/json.js"></script>
    <script async src="http://m1.s1.dpfile.com/mod/util-m-floatbar/1.0.5/util-m-floatbar.js"></script>
    <script async src="http://m1.s1.dpfile.com/mod/swipe/2.0.0/swipe.js"></script>
    <script async src="http://m1.s1.dpfile.com/mod/mobile-common-nav/1.2.1/mobile-common-nav.js"></script>
    <script>
        facade({ entry: "app-m-movie/js/pages/shop.js" });
        facade({ entry: "app-m-movie" });
        facade({ entry: "hippo" });
        facade({ entry: "nugget-mobile" });
    </script>
</body>
</html>