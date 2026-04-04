-- Unity Play Marketplace Schema
-- Generated: 2026-04-04

-- ============================================
-- SELLER
-- ============================================
CREATE TABLE seller (
    seller_id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    handle          VARCHAR(40)  NOT NULL UNIQUE,
    display_name    VARCHAR(120) NOT NULL,
    email           VARCHAR(255) NOT NULL UNIQUE,
    phone           VARCHAR(20),
    company_name    VARCHAR(200),
    tax_id          VARCHAR(50),
    website_url     VARCHAR(500),
    logo_url        VARCHAR(500),
    bio             TEXT,
    address_line1   VARCHAR(255),
    address_line2   VARCHAR(255),
    city            VARCHAR(100),
    state_province  VARCHAR(100),
    postal_code     VARCHAR(20),
    country_code    CHAR(2)      NOT NULL DEFAULT 'US',
    currency_code   CHAR(3)      NOT NULL DEFAULT 'USD',
    stripe_account_id VARCHAR(100),
    rating_avg      NUMERIC(3,2) DEFAULT 0.00 CHECK (rating_avg BETWEEN 0 AND 5),
    rating_count    INTEGER      DEFAULT 0,
    is_verified     BOOLEAN      NOT NULL DEFAULT FALSE,
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    verified_at     TIMESTAMPTZ,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE INDEX idx_seller_handle      ON seller (handle);
CREATE INDEX idx_seller_country     ON seller (country_code);
CREATE INDEX idx_seller_rating      ON seller (rating_avg DESC);
CREATE INDEX idx_seller_active      ON seller (is_active) WHERE is_active = TRUE;

-- ============================================
-- CUSTOMER
-- ============================================
CREATE TABLE customer (
    customer_id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username        VARCHAR(40)  NOT NULL UNIQUE,
    email           VARCHAR(255) NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    first_name      VARCHAR(80),
    last_name       VARCHAR(80),
    display_name    VARCHAR(120),
    phone           VARCHAR(20),
    avatar_url      VARCHAR(500),
    date_of_birth   DATE,
    address_line1   VARCHAR(255),
    address_line2   VARCHAR(255),
    city            VARCHAR(100),
    state_province  VARCHAR(100),
    postal_code     VARCHAR(20),
    country_code    CHAR(2)      NOT NULL DEFAULT 'US',
    preferred_currency CHAR(3)   NOT NULL DEFAULT 'USD',
    locale          VARCHAR(10)  NOT NULL DEFAULT 'en-US',
    stripe_customer_id VARCHAR(100),
    email_verified  BOOLEAN      NOT NULL DEFAULT FALSE,
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE,
    last_login_at   TIMESTAMPTZ,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE INDEX idx_customer_username  ON customer (username);
CREATE INDEX idx_customer_email     ON customer (email);
CREATE INDEX idx_customer_country   ON customer (country_code);
CREATE INDEX idx_customer_active    ON customer (is_active) WHERE is_active = TRUE;

-- ============================================
-- PRODUCT
-- ============================================
CREATE TABLE product (
    product_id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    seller_id       UUID         NOT NULL REFERENCES seller (seller_id),
    sku             VARCHAR(60)  NOT NULL,
    title           VARCHAR(200) NOT NULL,
    slug            VARCHAR(220) NOT NULL UNIQUE,
    description     TEXT,
    short_desc      VARCHAR(500),
    category        VARCHAR(80),
    subcategory     VARCHAR(80),
    tags            TEXT[]       DEFAULT '{}',
    price           NUMERIC(12,2) NOT NULL CHECK (price >= 0),
    compare_at_price NUMERIC(12,2) CHECK (compare_at_price >= 0),
    currency_code   CHAR(3)      NOT NULL DEFAULT 'USD',
    tax_class       VARCHAR(40)  DEFAULT 'standard',
    quantity_on_hand INTEGER     NOT NULL DEFAULT 0 CHECK (quantity_on_hand >= 0),
    low_stock_threshold INTEGER  DEFAULT 5,
    weight_kg       NUMERIC(8,3),
    dimensions_cm   JSONB,       -- {"length": 10, "width": 5, "height": 3}
    thumbnail_url   VARCHAR(500),
    media_urls      TEXT[]       DEFAULT '{}',
    platform        VARCHAR(40)  DEFAULT 'all',  -- all, ios, android, visionos, quest
    unity_version   VARCHAR(20),
    rating_avg      NUMERIC(3,2) DEFAULT 0.00 CHECK (rating_avg BETWEEN 0 AND 5),
    rating_count    INTEGER      DEFAULT 0,
    total_sales     INTEGER      DEFAULT 0,
    is_digital      BOOLEAN      NOT NULL DEFAULT TRUE,
    is_published    BOOLEAN      NOT NULL DEFAULT FALSE,
    is_featured     BOOLEAN      NOT NULL DEFAULT FALSE,
    published_at    TIMESTAMPTZ,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),

    UNIQUE (seller_id, sku)
);

CREATE INDEX idx_product_seller     ON product (seller_id);
CREATE INDEX idx_product_slug       ON product (slug);
CREATE INDEX idx_product_category   ON product (category, subcategory);
CREATE INDEX idx_product_tags       ON product USING GIN (tags);
CREATE INDEX idx_product_price      ON product (price);
CREATE INDEX idx_product_rating     ON product (rating_avg DESC);
CREATE INDEX idx_product_platform   ON product (platform);
CREATE INDEX idx_product_published  ON product (is_published, published_at DESC) WHERE is_published = TRUE;
CREATE INDEX idx_product_featured   ON product (is_featured) WHERE is_featured = TRUE;
CREATE INDEX idx_product_dimensions ON product USING GIN (dimensions_cm);
