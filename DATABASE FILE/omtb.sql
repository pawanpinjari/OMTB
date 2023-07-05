

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";




CREATE TABLE `tbl_bookings` (
  `book_id` int(11) NOT NULL,
  `ticket_id` varchar(30) NOT NULL,
  `t_id` int(11) NOT NULL COMMENT 'theater id',
  `user_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `no_seats` int(3) NOT NULL COMMENT 'number of seats',
  `amount` int(5) NOT NULL,
  `ticket_date` date NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL
);


INSERT INTO `tbl_bookings` (`book_id`, `ticket_id`, `t_id`, `user_id`, `show_id`, `screen_id`, `no_seats`, `amount`, `ticket_date`, `date`, `status`) VALUES
(1, 'BKID6369842', 4, 4, 17, 3, 1, 380, '2021-04-15', '2021-04-15', 1),
(2, 'BKID2313964', 6, 5, 21, 6, 4, 2400, '2021-04-16', '2021-04-15', 1),
(3, 'BKID1766021', 6, 5, 22, 6, 2, 1200, '2021-04-16', '2021-04-16', 1);



CREATE TABLE `tbl_contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(11) NOT NULL,
  `subject` varchar(1000) NOT NULL
);



CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT 'email',
  `password` varchar(50) NOT NULL,
  `user_type` int(1) NOT NULL
);



INSERT INTO `tbl_login` (`id`, `user_id`, `username`, `password`, `user_type`) VALUES
(1, 1, 'admin', 'password', 0),
(2, 2, 'theatre', 'password', 1),
(3, 3, 'theatre2', 'password', 1),
(4, 4, 'harry@gmail.com', 'password', 2),
(5, 5, 'USR295127', 'PWD195747', 1);




CREATE TABLE `tbl_movie` (
  `movie_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL COMMENT 'theatre id',
  `movie_name` varchar(255) NOT NULL,
  `cast` varchar(500) NOT NULL,
  `desc` varchar(1000) NOT NULL,
  `release_date` date NOT NULL,
  `image` varchar(200) NOT NULL,
  `video_url` varchar(200) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 means active '
);



INSERT INTO `tbl_movie` (`movie_id`, `t_id`, `movie_name`, `cast`, `desc`, `release_date`, `image`, `video_url`, `status`) VALUES
(1, 1, 'SHEKHAR', 'dr.rajashekhar athmeeya rajan','telgu movie', '2025-05-20', 'images/shekhar.png', 'https://youtu.be/BtLuusbybbE', 0),
(2, 2, 'BRAHMASTRA', 'Amitabh Bachchan,Ranbir kapoor,Alia Bhatt', 'This is the story of Shiva who sets out in search of love and self-discovery. During his journey, he has to face many evil forces that threaten our existence.', '2022-07-01', 'images/brahmastra.png', 'https://youtu.be/J_kD06npqFQ', 0),
(3, 3, 'ATTACK PART 1', 'John Abraham as Lieutenant Major Arjun Shergill,Rakul Preet Singh as Dr. Sabaha Qureshi', 'Witness the rise of an army soldier as he realizes his destiny and comes to terms to becoming Indias first super soldier created to combat terrorists as he fights', '2022-04-31', 'images/attack.png', 'https://youtu.be/KnC-XvFGflM', 0);



CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cast` varchar(100) NOT NULL,
  `news_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `attachment` varchar(200) NOT NULL
);



INSERT INTO `tbl_news` (`news_id`, `name`, `cast`, `news_date`, `description`, `attachment`) VALUES
(1, 'Pruthviraj', 'Akshay Kumar as Pruthviraj Chauhan Sanjay Dutt as Kaka Kanha Sonu Sood as Chand Bardai Manushi chhi', '2022-06-03', 'Hindi Movie', 'news_images/pruthviraj.png'),
(2, 'Tirsat', 'Directed by Mangesh Shendage', '2022-06-01', 'Marathi Movie', 'news_images/tirsat.png'),
(3,'Major','Adivi Sesh as Major Sandeep Unnikrishnan','2022-06-01','Hindi movie','news_images/major.png');


CREATE TABLE `tbl_registration` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) NOT NULL
);


INSERT INTO `tbl_registration` (`user_id`, `name`, `email`, `phone`, `age`, `gender`) VALUES
(1, 'Harry ', 'harry@gmail.com', '1247778540', 22, 'male'),
(2, 'pawan', 'pawanpinjari@gmail.com', '7066651454', 22, 'male');



CREATE TABLE `tbl_screens` (
  `screen_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL COMMENT 'theatre id',
  `screen_name` varchar(110) NOT NULL,
  `seats` int(11) NOT NULL COMMENT 'number of seats',
  `charge` int(11) NOT NULL
);



INSERT INTO `tbl_screens` (`screen_id`, `t_id`, `screen_name`, `seats`, `charge`) VALUES
(1, 1, 'Screen 1', 100, 350),
(2, 2, 'Screen 2', 150, 310),
(3, 3, 'Screen 1', 200, 380),
(4, 1, 'Screen1', 34, 250),
(5, 2, 'Demo Screen', 150, 300),
(6, 3, 'IMX Screen', 200, 600);



CREATE TABLE `tbl_shows` (
  `s_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL COMMENT 'show time id',
  `theatre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 means show available',
  `r_status` int(11) NOT NULL
);



INSERT INTO `tbl_shows` (`s_id`, `st_id`, `theatre_id`, `movie_id`, `start_date`, `status`, `r_status`) VALUES
(1, 1, 6, 11, '2021-04-15', 0, 1),
(2, 2, 6, 13, '2021-04-15', 0, 1),
(3, 3, 6, 12, '2021-03-31', 1, 1),
(4, 4, 6, 17, '2021-04-16', 1, 1);



CREATE TABLE `tbl_show_time` (
  `st_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT 'noon,second,etc',
  `start_time` time NOT NULL
);



INSERT INTO `tbl_show_time` (`st_id`, `screen_id`, `name`, `start_time`) VALUES
(1, 1, 'Noon', '10:00:00'),
(2, 2, 'First', '14:00:00'),
(3, 3, 'First', '18:00:00'),
(4, 4, 'Second', '21:00:00');


CREATE TABLE `tbl_theatre` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL
);



INSERT INTO `tbl_theatre` (`id`, `name`, `address`, `place`, `state`, `pin`) VALUES
(3, 'Kishor Cineplex', 'Shrirampur', 'Near Pineapple Cafe', 'Mh', 413709),
(4, 'NathGanga', 'Loni', '12 Street, Ep', 'Mh', 413204);


ALTER TABLE `tbl_bookings`
  ADD PRIMARY KEY (`book_id`);


ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);


ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tbl_movie`
  ADD PRIMARY KEY (`movie_id`); 

ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);


ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `tbl_screens`
  ADD PRIMARY KEY (`screen_id`);

ALTER TABLE `tbl_shows`
  ADD PRIMARY KEY (`s_id`);


ALTER TABLE `tbl_show_time`
  ADD PRIMARY KEY (`st_id`);


ALTER TABLE `tbl_theatre`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tbl_bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;

ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_registration`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_screens`
  MODIFY `screen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_shows`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_show_time`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `tbl_theatre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
