package com.example.restservice.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Note;

public interface NoteRepository extends JpaRepository<Note, Long> {

    List<Note> findByCandidatIdAndMatiereId(Long candidatId, Long matiereId);

}