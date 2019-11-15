-- create new table called bookshelves
CREATE TABLE bookshelves (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- select bookshelves from books table and instert into bookshelves table
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- create a bookshelf id in books table
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- populates bookshelf id with relative numbers
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- delete bookshelf column from books table
ALTER TABLE books DROP COLUMN bookshelf;

-- link bookshelf id from books table to bookshelf on bookshelves table
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);