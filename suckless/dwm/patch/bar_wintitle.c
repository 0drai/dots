// int
// width_wintitle(Bar *bar, BarArg *a)
// {
// 	return a->w;
// }
//
// int
// draw_wintitle(Bar *bar, BarArg *a)
// {
// 	int x = a->x + lrpad / 2, w = a->w - lrpad / 2;
// 	Monitor *m = bar->mon;
// 	Client *c = m->sel;
// 	int pad = lrpad / 2;
//
// 	if (!c) {
// 		drw_setscheme(drw, scheme[SchemeTitleNorm]);
// 		drw_rect(drw, x, a->y, w, a->h, 1, 1);
// 		return 0;
// 	}
//
// 	drw_setscheme(drw, scheme[m == selmon ? SchemeTitleSel : SchemeTitleNorm]);
//
// 	drw_text(drw, x, a->y, w, a->h, pad + (c->icon ? c->icon->width + ICONSPACING : 0), c->name, 0, False);
// 	if (c->icon)
// 		drw_img(drw, x + pad, a->y + (a->h - c->icon->height) / 2, c->icon, tmpicon);
//
// 	drawstateindicator(m, c, 1, x, a->y, w, a->h, 0, 0, c->isfixed);
// 	return 1;
// }
//
// int
// click_wintitle(Bar *bar, Arg *arg, BarArg *a)
// {
// 	return ClkWinTitle;
// }
//
