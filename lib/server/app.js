const app = express();

app.use("/");
app.use("/api", apiRouter);
app.use("/media", mediaRouter);





