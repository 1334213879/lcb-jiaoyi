/** layui-v2.2.3 MIT License By http://www.layui.com */
;
layui.define(["layer", "form"],
function(t) {
    "use strict";
    var e = layui.$,
    i = layui.layer,
    a = layui.form,
    l = (layui.hint(), layui.device()),
    n = "layedit",
    o = "layui-show",
    r = "layui-disabled",
    c = function() {
        var t = this;
        t.index = 0,
        t.config = {
            tool: ["face", "image","buttom"],
            hideTool: [],
            height: 60
        }
    };
    c.prototype.set = function(t) {
        var i = this;
        return e.extend(!0, i.config, t),
        i
    },
    c.prototype.on = function(t, e) {
        return layui.onevent(n, t, e)
    },
    c.prototype.build = function(t, i) {
        i = i || {};
        var a = this,
        n = a.config,
        r = "layui-layedit",
        c = e("#" + t),
        u = "LAY_layedit_" + ++a.index,
        d = c.next("." + r),
        y = e.extend({},
        n, i),
        f = function() {
            var t = [],
            e = {};
            return layui.each(y.hideTool,
            function(t, i) {
                e[i] = !0
            }),
            layui.each(y.tool,
            function(i, a) {
                C[a] && !e[a] && t.push(C[a])
            }),
            t.join("")
        } (),
        m = e(['<div class="' + r + '">', '<iframe id="' + u + '" name="' + u + '" textarea="' + t + '" frameborder="0"></iframe>','<div class="layui-layedit-tool" >' + f + "</div>", "</div>"].join(""));
        return l.ie && l.ie < 8 ? c.removeClass("layui-hide").addClass(o) : (d[0] && d.remove(), s.call(a, m, c[0], y), c.addClass("layui-hide").after(m), a.index)
    },
    c.prototype.getContent = function(t) {
        var e = u(t);
        if (e[0]) return d(e[0].document.body.innerHTML)
    },
    c.prototype.getText = function(t) {
        var i = u(t);
        if (i[0]) return e(i[0].document.body).text()
    },
    c.prototype.setContent = function(t, i, a) {
        var l = u(t);
        l[0] && (a ? e(l[0].document.body).append(i) : e(l[0].document.body).html(i), layedit.sync(t))
    },
    c.prototype.sync = function(t) {
        var i = u(t);
        if (i[0]) {
            var a = e("#" + i[1].attr("textarea"));
            a.val(d(i[0].document.body.innerHTML))
        }
    },
    c.prototype.getSelection = function(t) {
        var e = u(t);
        if (e[0]) {
            var i = m(e[0].document);
            return document.selection ? i.text: i.toString()
        }
    };
    var s = function(t, i, a) {
        var l = this,
        n = t.find("iframe");
        n.css({
            height: a.height
        }).on("load",
        function() {
            var o = n.contents(),
            r = n.prop("contentWindow"),
            c = o.find("head"),
            s = e(["<style>", "*{margin: 0; padding: 0;}", "body{padding: 10px; line-height: 20px; overflow-x: hidden; word-wrap: break-word; font: 14px Helvetica Neue,Helvetica,PingFang SC,Microsoft YaHei,Tahoma,Arial,sans-serif; -webkit-box-sizing: border-box !important; -moz-box-sizing: border-box !important; box-sizing: border-box !important;}", "a{color:#01AAED; text-decoration:none;}a:hover{color:#c00}", "p{margin-bottom: 10px;}", "img{display: inline-block; border: none; vertical-align: middle;}", "pre{margin: 10px 0; padding: 10px; line-height: 20px; border: 1px solid #ddd; border-left-width: 6px; background-color: #F2F2F2; color: #333; font-family: Courier New; font-size: 12px;}", "</style>"].join("")),
            u = o.find("body");
            c.append(s),
            u.attr("contenteditable", "true").css({
                "min-height": a.height
            }).html(i.value || ""),
            y.apply(l, [r, n, i, a]),
            g.call(l, r, t, a)
        })
    },
    u = function(t) {
        var i = e("#LAY_layedit_" + t),
        a = i.prop("contentWindow");
        return [a, i]
    },
    d = function(t) {
        return 8 == l.ie && (t = t.replace(/<.+>/g,
        function(t) {
            return t.toLowerCase()
        })),
        t
    },
    y = function(t, a, n, o) {
        var r = t.document,
        c = e(r.body);
        c.on("keydown",
        function(t) {
            var e = t.keyCode;
            if (13 === e) {
                var a = m(r),
                l = p(a),
                n = l.parentNode;
                if ("pre" === n.tagName.toLowerCase()) {
                    if (t.shiftKey) return;
                    return i.msg("请暂时用shift+enter"),
                    !1
                }
                r.execCommand("formatBlock", !1, "<p>")
            }
        }),
        e(n).parents("form").on("submit",
        function() {
            var t = c.html();
            8 == l.ie && (t = t.replace(/<.+>/g,
            function(t) {
                return t.toLowerCase()
            })),
            n.value = t
        }),
        c.on("paste",
        function(e) {
            r.execCommand("formatBlock", !1, "<p>"),
            setTimeout(function() {
                f.call(t, c),
                n.value = c.html()
            },
            100)
        })
    },
    f = function(t) {
        var i = this;
        i.document;
        t.find("*[style]").each(function() {
            var t = this.style.textAlign;
            this.removeAttribute("style"),
            e(this).css({
                "text-align": t || ""
            })
        }),
        t.find("table").addClass("layui-table"),
        t.find("script,link").remove()
    },
    m = function(t) {
        return t.selection ? t.selection.createRange() : t.getSelection().getRangeAt(0)
    },
    p = function(t) {
        return t.endContainer || t.parentElement().childNodes[0]
    },
    v = function(t, i, a) {
        var l = this.document,
        n = document.createElement(t);
        for (var o in i) n.setAttribute(o, i[o]);
        if (n.removeAttribute("text"), l.selection) {
            var r = a.text || i.text;
            if ("a" === t && !r) return;
            r && (n.innerHTML = r),
            a.pasteHTML(e(n).prop("outerHTML")),
            a.select()
        } else {
            var r = a.toString() || i.text;
            if ("a" === t && !r) return;
            r && (n.innerHTML = r),
            a.deleteContents(),
            a.insertNode(n)
        }
    },
    h = function(t, i) {
        var a = this.document,
        l = "layedit-tool-active",
        n = p(m(a)),
        o = function(e) {
            return t.find(".layedit-tool-" + e)
        };
        i && i[i.hasClass(l) ? "removeClass": "addClass"](l),
        t.find(">i").removeClass(l),
        o("unlink").addClass(r),
        e(n).parents().each(function() {
            var t = this.tagName.toLowerCase(),
            e = this.style.textAlign;
            "b" !== t && "strong" !== t || o("b").addClass(l),
            "i" !== t && "em" !== t || o("i").addClass(l),
            "u" === t && o("u").addClass(l),
            "strike" === t && o("d").addClass(l),
            "p" === t && ("center" === e ? o("center").addClass(l) : "right" === e ? o("right").addClass(l) : o("left").addClass(l)),
            "a" === t && (o("link").addClass(l), o("unlink").removeClass(r))
        })
    },
    g = function(t, a, l) {
        var n = t.document,
        o = e(n.body),
        c = {
            link: function(i) {
                var a = p(i),
                l = e(a).parent();
                b.call(o, {
                    href: l.attr("href"),
                    target: l.attr("target")
                },
                function(e) {
                    var a = l[0];
                    "A" === a.tagName ? a.href = e.url: v.call(t, "a", {
                        target: e.target,
                        href: e.url,
                        text: e.url
                    },
                    i)
                })
            },
            unlink: function(t) {
                n.execCommand("unlink")
            },
            face: function(e) {
                x.call(this,
                function(i) {
                    v.call(t, "img", {
                        src: i.src,
                        alt: i.alt
                    },
                    e)
                })
            },
            image: function(a) {
                var n = this;
                layui.use("upload",
                function(o) {
                    var r = l.uploadImage || {};
                    o.render({
                        url: r.url,
                        method: r.type,
                        elem: e(n).find("input")[0],
                        done: function(e) {
                            0 == e.code ? (e.data = e.data || {},
                            v.call(t, "img", {
                                src: e.data.src,
                                alt: e.data.title
                            },
                            a)) : i.msg(e.msg || "上传失败")
                        }
                    })
                })
            },
            code: function(e) {
                k.call(o,
                function(i) {
                    v.call(t, "pre", {
                        text: i.code,
                        "lay-lang": i.lang
                    },
                    e)
                })
            },
        },
        s = a.find(".layui-layedit-tool"),
        u = function() {
            var i = e(this),
            a = i.attr("layedit-event"),
            l = i.attr("lay-command");
            if (!i.hasClass(r)) {
                o.focus();
                var u = m(n);
                u.commonAncestorContainer;
                l ? (n.execCommand(l), /justifyLeft|justifyCenter|justifyRight/.test(l) && n.execCommand("formatBlock", !1, "<p>"), setTimeout(function() {
                    o.focus()
                },
                10)) : c[a] && c[a].call(this, u),
                h.call(t, s, i)
            }
        },
        d = /image/;
        s.find(">i").on("mousedown",
        function() {
            var t = e(this),
            i = t.attr("layedit-event");
            d.test(i) || u.call(this)
        }).on("click",
        function() {
            var t = e(this),
            i = t.attr("layedit-event");
            d.test(i) && u.call(this)
        }),
        o.on("click",
        function() {
            h.call(t, s),
            i.close(x.index)
        })
    },
     x = function(t) {
        var a = function() {
            var t = ["[微笑]", "[嘻嘻]", "[哈哈]", "[可爱]", "[可怜]", "[挖鼻]", "[吃惊]", "[害羞]", "[挤眼]", "[闭嘴]", "[鄙视]", "[爱你]", "[泪]", "[偷笑]", "[亲亲]", "[生病]", "[太开心]", "[白眼]", "[右哼哼]", "[左哼哼]", "[嘘]", "[衰]", "[委屈]", "[吐]", "[哈欠]", "[抱抱]", "[怒]", "[疑问]", "[馋嘴]", "[拜拜]", "[思考]", "[汗]", "[困]", "[睡]", "[钱]", "[失望]", "[酷]", "[色]", "[哼]", "[鼓掌]", "[晕]", "[悲伤]", "[抓狂]", "[黑线]", "[阴险]", "[怒骂]", "[互粉]", "[心]", "[伤心]", "[猪头]", "[熊猫]", "[兔子]", "[ok]", "[耶]", "[good]", "[NO]", "[赞]", "[来]", "[弱]", "[草泥马]", "[神马]", "[囧]", "[浮云]", "[给力]", "[围观]", "[威武]", "[奥特曼]", "[礼物]", "[钟]", "[话筒]", "[蜡烛]", "[蛋糕]"],
            e = {};
            return layui.each(t,
            function(t, i) {
                e[i] = layui.cache.dir + "images/face/" + t + ".gif"
            }),
            e
        } ();
        return x.hide = x.hide ||
        function(t) {
            "face" !== e(t.target).attr("layedit-event") && i.close(x.index)
        },
        x.index = i.tips(function() {
            var t = [];
            return layui.each(a,
            function(e, i) {
                t.push('<li title="' + e + '"><img src="' + i + '" alt="' + e + '"></li>')
            }),
            '<ul style="width:100%;position:fixed;left:0px;bottom:150px;" class="layui-clear">' + t.join("") + "</ul>"
        } (), this, {
            tips: 1,
            time: 0,
            skin: "layui-box layui-util-face",
            maxWidth: 500,
            success: function(l, n) {
                l.css({
                    marginTop: -4,
                    marginLeft: -10
                }).find(".layui-clear>li").on("click",
                function() {
                    t && t({
                        src: a[this.title],
                        alt: this.title
                    }),
                    i.close(n)
                }),
                e(document).off("click", x.hide).on("click", x.hide)
            }
        })
    },
    C = {
        html: '<i class="layui-icon layedit-tool-html" title="HTML源代码" lay-command="html" layedit-event="html"">&#xe64b;</i><span class="layedit-tool-mid"></span>',
        face: '<i class="layui-icon layedit-tool-face" title="表情" layedit-event="face"">&#xe650;</i>',
        buttom: '<button type="button" style="float:right;margin-top:5px;background-color:#c3c3c3;" class="layui-btn" lay-submit="" lay-filter="submit">发布</button>',
	   },
    w = new c;
    t(n, w)
});