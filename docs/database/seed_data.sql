-- Unity Play Marketplace — Test Seed Data
-- Run after schema.sql
-- Generated: 2026-04-04

BEGIN;

-- ============================================
-- SELLERS (5)
-- ============================================
INSERT INTO seller (seller_id, handle, display_name, email, phone, company_name, tax_id, website_url, logo_url, bio, address_line1, city, state_province, postal_code, country_code, currency_code, stripe_account_id, rating_avg, rating_count, is_verified, is_active, verified_at, created_at)
VALUES
  ('a1000000-0000-0000-0000-000000000001', 'pixel_forge', 'Pixel Forge Studios', 'hello@pixelforge.io', '+1-415-555-0101', 'Pixel Forge Studios LLC', 'US-EIN-12-3456789', 'https://pixelforge.io', 'https://cdn.example.com/logos/pixel_forge.png', 'Award-winning indie studio specializing in AR experiences and spatial games. Founded in San Francisco, shipping worldwide.', '42 Shader Lane', 'San Francisco', 'CA', '94107', 'US', 'USD', 'acct_pf_test_001', 4.72, 389, TRUE, TRUE, '2025-06-15 10:00:00+00', '2025-03-01 08:00:00+00'),

  ('a1000000-0000-0000-0000-000000000002', 'neon_arcade', 'Neon Arcade', 'team@neonarcade.dev', '+44-20-5555-0202', 'Neon Arcade Ltd', 'GB-VAT-123456789', 'https://neonarcade.dev', 'https://cdn.example.com/logos/neon_arcade.png', 'Retro-inspired game developers from London. We make games that glow.', '88 Brick Lane', 'London', 'England', 'E1 6RF', 'GB', 'GBP', 'acct_na_test_002', 4.45, 214, TRUE, TRUE, '2025-08-20 14:30:00+00', '2025-05-10 12:00:00+00'),

  ('a1000000-0000-0000-0000-000000000003', 'spatial_labs', 'Spatial Labs Co.', 'info@spatiallabs.co', '+1-512-555-0303', 'Spatial Labs Co.', 'US-EIN-98-7654321', 'https://spatiallabs.co', 'https://cdn.example.com/logos/spatial_labs.png', 'Building the future of mixed reality tooling. Unity assets, shaders, and AR frameworks.', '200 Congress Ave', 'Austin', 'TX', '78701', 'US', 'USD', 'acct_sl_test_003', 4.88, 612, TRUE, TRUE, '2025-04-01 09:00:00+00', '2025-01-15 07:00:00+00'),

  ('a1000000-0000-0000-0000-000000000004', 'tokyobyte', 'TokyoByte Inc.', 'dev@tokyobyte.jp', '+81-3-5555-0404', 'TokyoByte株式会社', 'JP-1234567890123', 'https://tokyobyte.jp', 'https://cdn.example.com/logos/tokyobyte.png', 'Tokyo-based creators of rhythm games, particle systems, and audio-reactive visuals for XR.', '3-5-7 Akihabara', 'Tokyo', 'Chiyoda', '101-0021', 'JP', 'JPY', 'acct_tb_test_004', 4.60, 178, TRUE, TRUE, '2025-09-10 06:00:00+00', '2025-07-01 04:00:00+00'),

  ('a1000000-0000-0000-0000-000000000005', 'nova_unverified', 'Nova Games (Pending)', 'nova@example.com', '+1-305-555-0505', NULL, NULL, NULL, NULL, 'New seller, just getting started. Awaiting verification.', '999 Ocean Dr', 'Miami', 'FL', '33139', 'US', 'USD', NULL, 0.00, 0, FALSE, TRUE, NULL, '2026-03-28 16:00:00+00');

-- ============================================
-- CUSTOMERS (8)
-- ============================================
INSERT INTO customer (customer_id, username, email, password_hash, first_name, last_name, display_name, phone, avatar_url, date_of_birth, address_line1, city, state_province, postal_code, country_code, preferred_currency, locale, stripe_customer_id, email_verified, is_active, last_login_at, created_at)
VALUES
  ('b2000000-0000-0000-0000-000000000001', 'alex_gamer', 'alex@example.com', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_alex', 'Alex', 'Rivera', 'Alex R.', '+1-646-555-1001', 'https://cdn.example.com/avatars/alex.png', '1994-07-22', '101 Broadway', 'New York', 'NY', '10006', 'US', 'USD', 'en-US', 'cus_alex_test_001', TRUE, TRUE, '2026-04-03 20:15:00+00', '2025-06-01 10:00:00+00'),

  ('b2000000-0000-0000-0000-000000000002', 'sam_builds', 'sam.b@example.com', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_sam', 'Samantha', 'Okafor', 'Sam Builds', '+1-310-555-1002', 'https://cdn.example.com/avatars/sam.png', '1988-11-03', '45 Sunset Blvd', 'Los Angeles', 'CA', '90028', 'US', 'USD', 'en-US', 'cus_sam_test_002', TRUE, TRUE, '2026-04-04 08:30:00+00', '2025-04-15 14:00:00+00'),

  ('b2000000-0000-0000-0000-000000000003', 'kenji_xr', 'kenji@example.jp', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_kenji', 'Kenji', 'Tanaka', 'KenjiXR', '+81-90-5555-1003', 'https://cdn.example.com/avatars/kenji.png', '1996-02-14', '2-8-1 Nishi-Shinjuku', 'Tokyo', 'Shinjuku', '160-0023', 'JP', 'JPY', 'ja-JP', 'cus_kenji_test_003', TRUE, TRUE, '2026-04-02 11:00:00+00', '2025-08-20 03:00:00+00'),

  ('b2000000-0000-0000-0000-000000000004', 'priya_dev', 'priya.d@example.in', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_priya', 'Priya', 'Deshmukh', 'Priya D.', '+91-98-5555-1004', 'https://cdn.example.com/avatars/priya.png', '1991-09-30', '14 MG Road', 'Bangalore', 'Karnataka', '560001', 'IN', 'USD', 'en-IN', 'cus_priya_test_004', TRUE, TRUE, '2026-04-01 05:45:00+00', '2025-10-05 09:00:00+00'),

  ('b2000000-0000-0000-0000-000000000005', 'lucas_ar', 'lucas@example.de', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_lucas', 'Lucas', 'Weber', 'LucasAR', '+49-30-5555-1005', 'https://cdn.example.com/avatars/lucas.png', '1999-04-18', 'Friedrichstrasse 42', 'Berlin', 'Berlin', '10117', 'DE', 'EUR', 'de-DE', 'cus_lucas_test_005', TRUE, TRUE, '2026-03-30 18:20:00+00', '2025-11-12 11:00:00+00'),

  ('b2000000-0000-0000-0000-000000000006', 'maria_quest', 'maria@example.com.br', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_maria', 'Maria', 'Santos', 'Maria Quest', '+55-11-5555-1006', 'https://cdn.example.com/avatars/maria.png', '1993-12-08', 'Rua Augusta 500', 'Sao Paulo', 'SP', '01304-000', 'BR', 'USD', 'pt-BR', 'cus_maria_test_006', TRUE, TRUE, '2026-04-04 02:10:00+00', '2025-09-22 15:00:00+00'),

  ('b2000000-0000-0000-0000-000000000007', 'new_player', 'newbie@example.com', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_newbie', 'Jordan', 'Lee', NULL, NULL, NULL, '2001-06-25', NULL, NULL, NULL, NULL, 'US', 'USD', 'en-US', NULL, FALSE, TRUE, NULL, '2026-04-04 10:00:00+00'),

  ('b2000000-0000-0000-0000-000000000008', 'inactive_user', 'gone@example.com', '$argon2id$v=19$m=65536,t=3,p=4$FAKEHASH_gone', 'Casey', 'Ng', 'Casey N.', '+1-604-555-1008', NULL, '1990-01-15', '100 Robson St', 'Vancouver', 'BC', 'V6B 2A8', 'CA', 'CAD', 'en-CA', 'cus_casey_test_008', TRUE, FALSE, '2025-12-01 09:00:00+00', '2025-03-10 08:00:00+00');

-- ============================================
-- PRODUCTS (12)
-- ============================================
INSERT INTO product (product_id, seller_id, sku, title, slug, description, short_desc, category, subcategory, tags, price, compare_at_price, currency_code, quantity_on_hand, weight_kg, dimensions_cm, thumbnail_url, media_urls, platform, unity_version, rating_avg, rating_count, total_sales, is_digital, is_published, is_featured, published_at, created_at)
VALUES
  -- Pixel Forge products
  ('c3000000-0000-0000-0000-000000000001', 'a1000000-0000-0000-0000-000000000001',
   'PF-AR-PONG-001', 'AR Pong Deluxe', 'ar-pong-deluxe',
   'A fully featured AR pong game with neon visuals, particle trails, and spatial audio. Play on any flat surface detected by your AR headset. Supports single-player vs AI, local multiplayer, and online matchmaking.',
   'Spatial AR pong with neon visuals and multiplayer support.',
   'Games', 'AR Sports', ARRAY['ar','pong','multiplayer','neon','spatial'],
   14.99, 19.99, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/ar-pong-deluxe/thumb.png',
   ARRAY['https://cdn.example.com/products/ar-pong-deluxe/screenshot1.png','https://cdn.example.com/products/ar-pong-deluxe/screenshot2.png','https://cdn.example.com/products/ar-pong-deluxe/trailer.mp4'],
   'all', '6000.4', 4.65, 128, 842, TRUE, TRUE, TRUE, '2025-09-01 12:00:00+00', '2025-08-15 10:00:00+00'),

  ('c3000000-0000-0000-0000-000000000002', 'a1000000-0000-0000-0000-000000000001',
   'PF-SHADER-GLOW-002', 'Neon Glow Shader Pack', 'neon-glow-shader-pack',
   'A collection of 24 highly optimized neon glow shaders for URP and HDRP. Includes bloom, edge glow, pulse, and holographic effects. Perfect for retro-futuristic AR games.',
   '24 optimized neon glow shaders for URP/HDRP.',
   'Assets', 'Shaders', ARRAY['shader','neon','glow','urp','hdrp','vfx'],
   29.99, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/neon-glow-shaders/thumb.png',
   ARRAY['https://cdn.example.com/products/neon-glow-shaders/demo.mp4'],
   'all', '6000.4', 4.80, 95, 1203, TRUE, TRUE, TRUE, '2025-07-01 08:00:00+00', '2025-06-20 06:00:00+00'),

  -- Neon Arcade products
  ('c3000000-0000-0000-0000-000000000003', 'a1000000-0000-0000-0000-000000000002',
   'NA-GAME-BRICK-001', 'Neon Breakout', 'neon-breakout',
   'Classic brick-breaker reimagined for AR. Smash glowing bricks floating in your living room with satisfying physics, power-ups, and 50 hand-crafted levels.',
   'AR brick-breaker with 50 levels and power-ups.',
   'Games', 'AR Arcade', ARRAY['ar','arcade','breakout','retro','casual'],
   9.99, 12.99, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/neon-breakout/thumb.png',
   ARRAY['https://cdn.example.com/products/neon-breakout/screenshot1.png','https://cdn.example.com/products/neon-breakout/trailer.mp4'],
   'all', '6000.4', 4.30, 87, 534, TRUE, TRUE, FALSE, '2025-10-15 10:00:00+00', '2025-10-01 08:00:00+00'),

  ('c3000000-0000-0000-0000-000000000004', 'a1000000-0000-0000-0000-000000000002',
   'NA-ASSET-RETRO-002', 'Retro Pixel UI Kit', 'retro-pixel-ui-kit',
   'Complete UI kit with 200+ pixel-art styled components: buttons, panels, health bars, inventory slots, dialog boxes, and more. Includes TextMeshPro presets and animation controllers.',
   '200+ pixel-art UI components with TMP presets.',
   'Assets', 'UI', ARRAY['ui','pixel-art','retro','textmeshpro','kit'],
   19.99, 24.99, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/retro-pixel-ui/thumb.png',
   ARRAY['https://cdn.example.com/products/retro-pixel-ui/preview.png'],
   'all', '2022.3', 4.55, 142, 2108, TRUE, TRUE, TRUE, '2025-06-01 12:00:00+00', '2025-05-15 10:00:00+00'),

  -- Spatial Labs products
  ('c3000000-0000-0000-0000-000000000005', 'a1000000-0000-0000-0000-000000000003',
   'SL-FW-ARCORE-001', 'SpatialKit AR Framework', 'spatialkit-ar-framework',
   'Production-ready AR framework for Unity. Handles plane detection, object placement, occlusion, light estimation, and persistent anchors across ARCore, ARKit, and Meta Quest. Drop-in prefabs and clean C# API.',
   'Production AR framework: plane detection, anchors, occlusion.',
   'Tools', 'Frameworks', ARRAY['ar','framework','arcore','arkit','quest','spatial','toolkit'],
   79.99, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/spatialkit/thumb.png',
   ARRAY['https://cdn.example.com/products/spatialkit/demo.mp4','https://cdn.example.com/products/spatialkit/docs.pdf'],
   'all', '6000.4', 4.92, 310, 1875, TRUE, TRUE, TRUE, '2025-04-15 08:00:00+00', '2025-03-01 06:00:00+00'),

  ('c3000000-0000-0000-0000-000000000006', 'a1000000-0000-0000-0000-000000000003',
   'SL-TOOL-PERF-002', 'AR Performance Profiler', 'ar-performance-profiler',
   'Editor tool that benchmarks your AR app across thermal throttling, draw calls, polygon counts, and frame timing. Generates PDF reports with optimization suggestions.',
   'AR performance benchmarking and optimization reports.',
   'Tools', 'Editor Extensions', ARRAY['profiler','performance','optimization','editor','ar'],
   49.99, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/ar-profiler/thumb.png',
   ARRAY['https://cdn.example.com/products/ar-profiler/screenshot1.png'],
   'all', '6000.4', 4.75, 89, 423, TRUE, TRUE, FALSE, '2025-08-01 10:00:00+00', '2025-07-15 08:00:00+00'),

  -- TokyoByte products
  ('c3000000-0000-0000-0000-000000000007', 'a1000000-0000-0000-0000-000000000004',
   'TB-GAME-RHYTHM-001', 'Beat Dimension', 'beat-dimension',
   'Rhythm game where you slash through beats floating in augmented reality. 30 built-in tracks, custom song import via BeatMap format, and online leaderboards.',
   'AR rhythm game — slash beats in mixed reality.',
   'Games', 'AR Rhythm', ARRAY['ar','rhythm','music','beats','leaderboard'],
   12.99, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/beat-dimension/thumb.png',
   ARRAY['https://cdn.example.com/products/beat-dimension/trailer.mp4','https://cdn.example.com/products/beat-dimension/gameplay.png'],
   'quest', '6000.4', 4.50, 203, 1567, TRUE, TRUE, TRUE, '2025-11-01 06:00:00+00', '2025-10-10 04:00:00+00'),

  ('c3000000-0000-0000-0000-000000000008', 'a1000000-0000-0000-0000-000000000004',
   'TB-VFX-PARTICLE-002', 'Sakura Particle Collection', 'sakura-particle-collection',
   'Beautiful cherry blossom particle systems for Unity. 15 presets including falling petals, wind gusts, petal bursts, and ambient drift. GPU instanced, mobile-optimized.',
   '15 cherry blossom particle presets, GPU instanced.',
   'Assets', 'VFX', ARRAY['particles','vfx','sakura','cherry-blossom','nature','mobile'],
   8.99, 12.99, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/sakura-particles/thumb.png',
   ARRAY['https://cdn.example.com/products/sakura-particles/preview.mp4'],
   'all', '2022.3', 4.70, 156, 987, TRUE, TRUE, FALSE, '2025-04-01 04:00:00+00', '2025-03-20 02:00:00+00'),

  -- Physical product (merch from Pixel Forge)
  ('c3000000-0000-0000-0000-000000000009', 'a1000000-0000-0000-0000-000000000001',
   'PF-MERCH-TEE-001', 'AR Pong Championship Tee', 'ar-pong-championship-tee',
   'Premium cotton t-shirt with the AR Pong Deluxe championship logo. Available in S/M/L/XL. Printed with eco-friendly inks.',
   'AR Pong championship logo t-shirt.',
   'Merchandise', 'Apparel', ARRAY['tshirt','merch','pong','apparel'],
   24.99, NULL, 'USD', 150, 0.250, '{"length": 30, "width": 22, "height": 3}',
   'https://cdn.example.com/products/pong-tee/thumb.png',
   ARRAY['https://cdn.example.com/products/pong-tee/front.png','https://cdn.example.com/products/pong-tee/back.png'],
   NULL, NULL, 4.20, 34, 89, FALSE, TRUE, FALSE, '2026-01-15 12:00:00+00', '2026-01-10 10:00:00+00'),

  -- Low stock physical product
  ('c3000000-0000-0000-0000-000000000010', 'a1000000-0000-0000-0000-000000000003',
   'SL-HW-MOUNT-001', 'AR Glasses Desk Mount', 'ar-glasses-desk-mount',
   'Adjustable aluminum desk mount for AR glasses. Compatible with Xreal, Viture, and Rokid. Magnetic quick-release. Cable management channel built in.',
   'Universal AR glasses desk mount with magnetic release.',
   'Accessories', 'Hardware', ARRAY['mount','desk','xreal','viture','rokid','hardware'],
   39.99, 49.99, 'USD', 3, 0.480, '{"length": 18, "width": 12, "height": 15}',
   'https://cdn.example.com/products/desk-mount/thumb.png',
   ARRAY['https://cdn.example.com/products/desk-mount/photo1.png','https://cdn.example.com/products/desk-mount/photo2.png'],
   NULL, NULL, 4.85, 52, 198, FALSE, TRUE, FALSE, '2025-12-01 08:00:00+00', '2025-11-20 06:00:00+00'),

  -- Draft product (not published)
  ('c3000000-0000-0000-0000-000000000011', 'a1000000-0000-0000-0000-000000000002',
   'NA-GAME-INVADERS-003', 'Space Invaders AR (BETA)', 'space-invaders-ar-beta',
   'Work in progress: classic Space Invaders in AR. Aliens descend from your ceiling. Still in beta — expect bugs.',
   'AR Space Invaders — beta, coming soon.',
   'Games', 'AR Arcade', ARRAY['ar','arcade','space-invaders','beta','wip'],
   0.00, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/space-invaders-ar/thumb_wip.png',
   '{}',
   'quest', '6000.4', 0.00, 0, 0, TRUE, FALSE, FALSE, NULL, '2026-03-15 14:00:00+00'),

  -- Product from unverified seller
  ('c3000000-0000-0000-0000-000000000012', 'a1000000-0000-0000-0000-000000000005',
   'NV-GAME-MAZE-001', 'AR Maze Runner', 'ar-maze-runner',
   'Navigate procedurally generated mazes in your room. First game from an indie newcomer.',
   'Procedural AR maze game.',
   'Games', 'AR Puzzle', ARRAY['ar','maze','procedural','puzzle','indie'],
   4.99, NULL, 'USD', 9999, NULL, NULL,
   'https://cdn.example.com/products/ar-maze/thumb.png',
   '{}',
   'all', '6000.4', 0.00, 0, 0, TRUE, FALSE, FALSE, NULL, '2026-04-01 18:00:00+00');

COMMIT;

-- ============================================
-- Quick verification queries
-- ============================================
-- SELECT 'sellers' AS tbl, count(*) FROM seller
-- UNION ALL SELECT 'customers', count(*) FROM customer
-- UNION ALL SELECT 'products', count(*) FROM product;
