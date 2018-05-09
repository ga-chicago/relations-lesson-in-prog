
INSERT INTO waiters (name) VALUES ('Samat');
INSERT INTO waiters (name) VALUES ('Irwin');
INSERT INTO waiters (name) VALUES ('Hannah');
INSERT INTO waiters (name) VALUES ('Marie');
INSERT INTO menuitems (name, description, price) VALUES ('Hot Dog', 'Try it Chicago Style: steamed all-beef frank with onions, tomatoes, pickles, cucumbers, relish, mustard, celery salt AND NEVER KETCHUP', 2.99);
INSERT INTO menuitems (name, description, price) VALUES ('Omelette', 'Fancy french egg thing', 8.50);
INSERT INTO menuitems (name, description, price) VALUES ('Salad', 'Try: Goat walnut gorgonzola cranberry on spring greens', 7.25);
INSERT INTO menuitems (name, description, price) VALUES ('Pasta', 'U name it', 12.99);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (1, 1, 'chicago style', true);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (2, 1, 'egg whites only', true);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (1, 2, 'mustard and kraut plz', true);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (2, 2, 'bacon broc moz garlic', true);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (3, 3, 'cobb salad', true);
INSERT INTO orders (menuitem_id, waiter_id, notes, open) VALUES (3, 4, 'mushroom rav', true);