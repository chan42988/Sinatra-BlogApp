users = User.create([

	{username: "jerrybi", password: "12345", birthday: 5/22/1993, email: "jerrybi0522@gmail.com", fname: "Jerry", lname: "Bi"},
	{username: "chrishan", password: "12345", birthday: 4/29/1988, email: "chan42988@gmail.com", fname: "Chris", lname: "Han"},
	{username: "iliketurtles", password: "12345", birthday: 5/3/1990, email: "someemail@gmail.com", fname: "John", lname: "Doe"}

])

Post.create([
	{user_id: users.sample.id}
	])