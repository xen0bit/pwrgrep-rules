// CWE-352: CSRF - Actix POST without token
use actix_web::{post, HttpResponse};

// ruleid: rust-csrf
#[post("/transfer")]
async fn transfer() -> HttpResponse {
    HttpResponse::Ok().body("transferred")
}

// ruleid: rust-csrf
#[post("/update")]
async fn update() -> HttpResponse {
    HttpResponse::Ok().body("updated")
}

#[post("/safe")]
// ok: rust-csrf
async fn safe_transfer(req: actix_web::HttpRequest) -> HttpResponse {
    if req.headers().contains_key("X-CSRF-Token") {
        HttpResponse::Ok().body("ok")
    } else {
        HttpResponse::Forbidden().body("csrf missing")
    }
}

#[post("/safe2")]
// ok: rust-csrf
async fn safe2(req: actix_web::HttpRequest) -> HttpResponse {
    if req.headers().contains_key("X-CSRF-Token") {
        HttpResponse::Ok().body("ok")
    } else {
        HttpResponse::Forbidden().body("no")
    }
}

#[post("/safe3")]
// ok: rust-csrf
async fn safe3(req: actix_web::HttpRequest) -> HttpResponse {
    let _ = req.headers().get("X-CSRF-Token");
    let token = "x";
    HttpResponse::Ok().body(token)
}
