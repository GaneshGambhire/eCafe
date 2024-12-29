-- Inserting Hot Drinks
INSERT INTO Product ("Name", "Description", "Status", "Image", "Price", "Category") 
VALUES 
('Karak Chai', 'Strongly brewed tea with milk and spices', 'available', 'karak_chai.jpg', 50, 'Hot Drinks'),
('Doodh Patti', 'Traditional Pakistani milk tea', 'available', 'doodh_patti.jpg', 40, 'Hot Drinks'),
('Qahwa', 'Arabic coffee with cardamom and saffron', 'available', 'qahwa.jpg', 60, 'Hot Drinks'),
('Irani Chai', 'Sweet and aromatic Iranian tea', 'unavailable', 'irani_chai.jpg', 45, 'Hot Drinks');

-- Inserting Cold Drinks
INSERT INTO Product ("Name", "Description", "Status", "Image", "Price", "Category") 
VALUES 
('Mango Lassi', 'Yogurt-based smoothie with mango pulp', 'available', 'mango_lassi.jpg', 70, 'Cold Drinks'),
('Pakola', 'Pakistani carbonated soft drink', 'available', 'pakola.jpg', 30, 'Cold Drinks'),
('Fresh Lime Soda', 'Refreshing drink made with lime and soda water', 'available', 'lime_soda.jpg', 60, 'Cold Drinks'),
('Sugarcane Juice', 'Freshly squeezed sugarcane juice', 'available', 'sugarcane_juice.jpg', 50, 'Cold Drinks');

-- Inserting Desi Food
INSERT INTO Product ("Name", "Description", "Status", "Image", "Price", "Category") 
VALUES 
('Chicken Biryani', 'Fragrant rice cooked with chicken and spices', 'available', 'chicken_biryani.jpg', 150, 'Desi Food'),
('Nihari', 'Slow-cooked beef stew with spices', 'available', 'nihari.jpg', 180, 'Desi Food'),
('Haleem', 'Thick stew made of wheat, barley, meat, and lentils', 'unavailable', 'haleem.jpg', 200, 'Desi Food'),
('Chicken Karahi', 'Spicy chicken curry cooked in a wok', 'available', 'chicken_karahi.jpg', 160, 'Desi Food');

-- Inserting Fast Food
INSERT INTO Product ("Name", "Description", "Status", "Image", "Price", "Category") 
VALUES 
('Chicken Tikka', 'Marinated chicken grilled to perfection', 'available', 'chicken_tikka.jpg', 120, 'Fast Food'),
('Seekh Kebab', 'Minced meat skewers seasoned with spices', 'available', 'seekh_kebab.jpg', 100, 'Fast Food'),
('Vegetable Samosa', 'Crispy pastry filled with spiced vegetables', 'available', 'vegetable_samosa.jpg', 50, 'Fast Food'),
('Chicken Shawarma', 'Grilled chicken wrapped in flatbread with garlic sauce', 'available', 'chicken_shawarma.jpg', 80, 'Fast Food');
